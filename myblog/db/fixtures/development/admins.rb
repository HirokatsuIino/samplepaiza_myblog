require 'csv'

csv = CSV.read('db/fixtures/development/admins.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  email = line[1]
  password = line[2]
  last_name = line[3]
  first_name = line[4]
  last_name_kana = line[5]
  first_name_kana = line[6]

  Admin.seed_once(:id) do |s|
    # s.id = id
    s.email = email
    s.password = password
    s.last_name = last_name
    s.first_name = first_name
    s.last_name_kana = last_name_kana
    s.first_name_kana = first_name_kana
  end
end

# コマンド
# rails db:seed_fu FILTER=admins
#
# id, email, password, last_name, first_name, last_name_kana, first_name_kana
#