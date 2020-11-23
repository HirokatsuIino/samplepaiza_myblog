require 'csv'

csv = CSV.read('db/fixtures/development/service_catalog_order_unit_categories.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  service_catalog_id = line[1]
  order_unit_id = line[2]

  ServiceCatalogOrderUnitCategory.seed_once(:id) do |s|
    # s.id = id
    s.service_catalog_id = service_catalog_id
    s.order_unit_id = order_unit_id
  end
end

# コマンド
# rails db:seed_fu FILTER=service_catalog_order_unit_categories
#
# id, service_catalog_id, order_unit_id
#