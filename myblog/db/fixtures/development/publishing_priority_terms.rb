require 'csv'

csv = CSV.read('db/fixtures/development/publishing_priority_terms.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  client_publishing_tersms_id = line[1]
  publishing_priority_id = line[2]
  begin_at = line[3]

  PublishingPriorityTerm.seed_once(:id) do |s|
    # s.id = id
    s.client_publishing_tersms_id = client_publishing_tersms_id
    s.publishing_priority_id = publishing_priority_id
    s.begin_at = begin_at
  end
end

# コマンド
# rails db:seed_fu FILTER=publishing_priority_terms
#
# id, client_publishing_tersms_id, publishing_priority_id, begin_at
#