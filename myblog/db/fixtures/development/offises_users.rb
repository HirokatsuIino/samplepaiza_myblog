require 'csv'

csv = CSV.read('db/fixtures/development/offises_users.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  office_id = line[1]
  user_id = line[2]


  OffisesUser.seed_once(:id) do |s|
    # s.id = id
    s.office_id = office_id
    s.user_id = user_id
  end
end

# コマンド
# rails db:seed_fu FILTER=offises_users
# id, office_id, user_id
