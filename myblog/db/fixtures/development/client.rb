require 'csv'

csv = CSV.read('db/fixtures/development/client.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  # client_type_id = line[1]
  name = line[2]
  admin_comment = line[3]
  area_important = line[4]
  # nav_id = line[5]



  Client.seed_once(:id) do |s|
    # s.id = id
    # s.client_type_id = client_type_id
    s.name = name
    s.admin_comment = admin_comment
    s.area_important = area_important
    # s.nav_id = nav_id
  end
end

# コマンド
# rails db:seed_fu FILTER=client
#
# id, client_type_id, name, admin_comment, area_important, nav_id