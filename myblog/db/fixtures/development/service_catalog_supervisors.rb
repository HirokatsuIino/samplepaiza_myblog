require 'csv'

csv = CSV.read('db/fixtures/development/service_catalog_supervisors.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  service_catalog_id = line[1]
  supervisor_id = line[2]

  ServiceCatalogSupervisor.seed_once(:id) do |s|
    # s.id = id
    s.service_catalog_id = service_catalog_id
    s.supervisor_id = supervisor_id
  end
end

# コマンド
# rails db:seed_fu FILTER=service_catalog_supervisors
#
# id, service_catalog_id, supervisor_id
#