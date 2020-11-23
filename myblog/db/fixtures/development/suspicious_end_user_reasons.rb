require 'csv'

csv = CSV.read('db/fixtures/development/suspicious_end_user_reasons.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  suspicious_end_user_reason_comment = line[1]

  SuspiciousEndUserReason.seed_once(:id) do |s|
    # s.id = id
    s.suspicious_end_user_reason_comment = suspicious_end_user_reason_comment
  end
end

# コマンド
# rails db:seed_fu FILTER=suspicious_end_user_reasons
#
# id, suspicious_end_user_reason_comment
#