require 'csv'

csv = CSV.read('db/fixtures/development/partners_list.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  client_id = line[1]
  office_id = line[2]
  identical_for_clientflag = line[3]


  PartnersList.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.office_id = office_id
    s.identical_for_clientflag = identical_for_clientflag
  end
end

# コマンド
# rails db:seed_fu FILTER=partners_list
# id, client_id, office_id, identical_for_clientflag
