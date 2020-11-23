require 'csv'

csv = CSV.read('db/fixtures/development/service_catalog_order_methods.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  service_catalog_id = line[1]
  order_method_id = line[2]

  ServiceCatalogOrderMethod.seed_once(:id) do |s|
    # s.id = id
    s.service_catalog_id = service_catalog_id
    s.order_method_id = order_method_id
  end
end

# コマンド
# rails db:seed_fu FILTER=service_catalog_order_methods
#
# id, service_catalog_id, order_method_id
#