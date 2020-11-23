require 'csv'

csv = CSV.read('db/fixtures/development/roles.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  name = line[1]

  Role.seed_once(:id) do |s|
    # s.id = id
    s.name = name
  end
end

# コマンド
# rails db:seed_fu FILTER=roles
#
# id, client_publishing_setting_id, begin_at, end_at, flg
#