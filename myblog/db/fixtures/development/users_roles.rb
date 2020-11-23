require 'csv'

csv = CSV.read('db/fixtures/development/users_roles.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  user_id = line[1]
  role_id = line[2]


  UsersRole.seed_once(:id) do |s|
    # s.id = id
    s.user_id = user_id
    s.role_id = role_id
  end
end

# コマンド
# rails db:seed_fu FILTER=users_roles
# id, user_id, role_id