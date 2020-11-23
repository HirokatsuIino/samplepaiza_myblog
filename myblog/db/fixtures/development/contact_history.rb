require 'csv'

csv = CSV.read('db/fixtures/development/contact_histories.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  document_request_id = line[1]
  name = line[2]
  name_hira = line[3]
  email = line[4]
  tel = line[5]
  supported_at = line[6]
  comment = line[7]
  support_required_flg = line[8]


  ContactHistory.seed_once(:id) do |s|
    # s.id = id
    s.document_request_id = document_request_id
    s.name = name
    s.name_hira = name_hira
    s.email = email
    s.tel = tel
    s.supported_at = supported_at
    s.comment = comment
    s.support_required_flg = support_required_flg
  end
end

# コマンド
# rails db:seed_fu FILTER=contact_history
