require 'csv'

csv = CSV.read('db/fixtures/development/service_catalogs.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  client_id = line[1]
  office_id = line[2]
  identical_for_clientflag = line[3]
  tasting_flag = line[4]
  safety_confirmation_flag = line[5]

  ServiceCatalog.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.office_id = office_id
    s.identical_for_clientflag = identical_for_clientflag
    s.tasting_flag = tasting_flag
    s.safety_confirmation_flag = safety_confirmation_flag
  end
end

# コマンド
# rails db:seed_fu FILTER=service_catalogs
#
# id, client_id, office_id, identical_for_clientflag, tasting_flag, safety_confirmation_flag
#