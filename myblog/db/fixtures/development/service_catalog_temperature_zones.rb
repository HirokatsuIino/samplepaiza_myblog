require 'csv'

csv = CSV.read('db/fixtures/development/service_catalog_temperature_zones.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  service_catalog_id = line[1]
  temperature_id = line[2]

  ServiceCatalogTemperatureZone.seed_once(:id) do |s|
    # s.id = id
    s.service_catalog_id = service_catalog_id
    s.temperature_id = temperature_id
  end
end

# コマンド
# rails db:seed_fu FILTER=service_catalog_temperature_zones
#
# id, service_catalog_id, temperature_id
#