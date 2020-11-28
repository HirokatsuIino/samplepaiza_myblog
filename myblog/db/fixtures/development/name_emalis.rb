require 'csv'

csv = CSV.read('db/fixtures/development/name_emails.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  name = line[1]
  email = line[2]

  NameEmail.seed_once(:id) do |s|
    # s.id = id
    s.name = name
    s.email = email
  end
end

# コマンド
# rails db:seed_fu FILTER=name_emails
# id, name, email
