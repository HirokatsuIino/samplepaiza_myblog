require 'csv'

csv = CSV.read('db/fixtures/development/service_catalog_other_incidental_services.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  service_catalog_id = line[1]
  other_incidental_service_id = line[2]

  ServiceCatalogOtherIncidentalService.seed_once(:id) do |s|
    # s.id = id
    s.service_catalog_id = service_catalog_id
    s.other_incidental_service_id = other_incidental_service_id
  end
end

# コマンド
# rails db:seed_fu FILTER=service_catalog_other_incidental_services
#
# id, service_catalog_id, other_incidental_service_id
#