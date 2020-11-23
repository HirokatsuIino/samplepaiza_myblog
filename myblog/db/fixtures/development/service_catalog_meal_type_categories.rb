require 'csv'

csv = CSV.read('db/fixtures/development/service_catalog_meal_type_categories.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  service_catalog_id = line[1]
  meal_time_id = line[2]

  ServiceCatalogMealTypeCategory.seed_once(:id) do |s|
    # s.id = id
    s.service_catalog_id = service_catalog_id
    s.meal_time_id = meal_time_id
  end
end

# コマンド
# rails db:seed_fu FILTER=service_catalog_meal_type_categories
#
# id, service_catalog_id, meal_time_id
#