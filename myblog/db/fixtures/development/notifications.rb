require 'csv'

csv = CSV.read('db/fixtures/development/notifications.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  title = line[1]
  body = line[2]
  begin_at = line[3]
  end_at = line[4]


  Notification2.seed_once(:id) do |s|
    # s.id = id
    s.title = title
    s.body = body
    s.begin_at = begin_at
    s.end_at = end_at
  end
end

# コマンド
# rails db:seed_fu FILTER=notifications
