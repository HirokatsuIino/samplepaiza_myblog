require 'csv'

csv = CSV.read('db/fixtures/development/suspicious_end_users.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  nadocument_request_idme = line[1]
  unknown_tel = line[2]
  unknown_email = line[3]
  call_prohibited_flg = line[4]
  mail_prohibited_flg = line[5]
  careful_eu_reson_id = line[6]

  SuspiciousEndUser.seed_once(:id) do |s|
    # s.id = id
    s.nadocument_request_idme = nadocument_request_idme
    s.unknown_tel = unknown_tel
    s.unknown_email = unknown_email
    s.call_prohibited_flg = call_prohibited_flg
    s.mail_prohibited_flg = mail_prohibited_flg
    s.careful_eu_reson_id = careful_eu_reson_id
  end
end

# コマンド
# rails db:seed_fu FILTER=suspicious_end_users
#
# id, document_request_id, unknown_tel, unknown_email, call_prohibited_flg, mail_prohibited_flg, careful_eu_reson_id
#