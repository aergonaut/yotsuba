class Furniture < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_text, against: [:name, :series]

  include GraphqlObject

  has_many :variants, as: :item, inverse_of: :item, dependent: :destroy

  def self.seed_from_data(data)
    data.each do |data|
      type = data["sourceSheet"].downcase.underscore.to_sym
      klass =
        case type
        when :fencing
          Fence
        when :floors
          Floor
        when :housewares
          Houseware
        when :miscellaneous
          Komono
        when :rugs
          Rug
        when :wall_mounted
          WallMounted
        when :wallpapers
          Wallpaper
        else
          logger.error "Skipping furniture record with unknown type: #{type}"
          next
        end

      record = klass.from_data(data)
      unless record.save
        logger.error "Could not save record for #{data['name']}"
        logger.error "Errors: #{record.errors.full_messages.inspect}"
        next
      end

      if data["variants"].any?
        record.variants_from_data(data["variants"])
      end
    end
  end

  def self.from_data(data)
    record =
      self.find_or_initialize_by(name: data["name"])

    next_attributes = 
      {
        diy: data["diy"],
        catalog: data["catalog"] == "For sale",
        series: data["series"],
        size: data["size"],
        source_notes: data["sourceNotes"]
      }
    record.attributes = next_attributes
    record
  end

  def variants_from_data(data)
    # destroy variants whose `unique_entry_id` no longer exists in the source
    variants.where.not(unique_entry_id: data.collect { |d| d["uniqueEntryId"] }).destroy_all

    # create or update variants
    data.each do |variant_data|
      variant = variants.find_or_initialize_by(unique_entry_id: variant_data["uniqueEntryId"])
      next_attributes =
        {
          image_url: variant_data["image"] || variant_data["inventoryImage"],
          filename: variant_data["filename"],
          variation: variant_data["variation"],
          variant_id: variant_data["variantId"],
          buy: variant_data["buy"],
          sell: variant_data["sell"],
          sources: variant_data["source"],
          colors: variant_data["colors"]
        }
      unless variant.update(next_attributes)
        logger.error "Could not update variant #{variant_data["uniqueEntryId"]}"
        logger.error "Errors: #{variant.errors.full_messages.inspect}"
      end
    end
  end
end
