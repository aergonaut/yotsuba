class Furniture < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_text, against: [:name, :series]

  include GraphqlObject

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
      record.save!
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
end
