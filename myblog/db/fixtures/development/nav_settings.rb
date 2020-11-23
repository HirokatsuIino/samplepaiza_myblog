require 'csv'

csv = CSV.read('db/fixtures/development/nav_settings.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  name = line[1]
  client_code = line[2]
  partner_code = line[3]
  name_for_invoice = line[4]
  comment = line[4]


  NavSetting.seed_once(:id) do |s|
    # s.id = id
    s.name = name
    s.client_code = client_code
    s.partner_code = partner_code
    s.name_for_invoice = name_for_invoice
    s.comment = comment
  end
end

# コマンド
# rails db:seed_fu FILTER=nav_settings
# id, name, client_code, partner_code, name_for_invoice, comment
