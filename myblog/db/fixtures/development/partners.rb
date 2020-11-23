require 'csv'

csv = CSV.read('db/fixtures/development/partners.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  partners_list_id = line[1]
  name = line[2]
  title = line[3]
  email = line[4]
  tel = line[5]
  admin_comment = line[6]


  Partner.seed_once(:id) do |s|
    # s.id = id
    s.partners_list_id = partners_list_id
    s.name = name
    s.title = title
    s.email = email
    s.tel = tel
    s.admin_comment = admin_comment
  end
end

# コマンド
# rails db:seed_fu FILTER=partners
# id, partners_list_id, name, title, email, tel, admin_comment
