require 'csv'

csv = CSV.read('db/fixtures/development/publishing_terms.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  client_publishing_setting_id = line[1]
  begin_at = line[2]
  end_at = line[3]
  flg = line[4]

  PublishingTerm.seed_once(:id) do |s|
    # s.id = id
    s.client_publishing_setting_id = client_publishing_setting_id
    s.begin_at = begin_at
    s.end_at = end_at
    s.flg = flg
  end
end

# コマンド
# rails db:seed_fu FILTER=publishing_terms
#
# id, client_publishing_setting_id, begin_at, end_at, flg
#