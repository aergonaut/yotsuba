namespace :data do
  task fill_furniture_slug: :environment do
    Furniture.find_in_batches do |batch|
      batch.each do |furniture|
        furniture.update(slug: furniture.name.parameterize)
      end
    end
  end
end
