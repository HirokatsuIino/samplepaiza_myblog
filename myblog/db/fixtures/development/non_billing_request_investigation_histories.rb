require 'csv'

csv = CSV.read('db/fixtures/development/non_billing_request_investigation_histories.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  non_billing_request_id = line[1]
  investigated_at = line[2]
  investigated_comment = line[3]
  investigated_id = line[4]


  NonBillingRequestInvestigationHistory.seed_once(:id) do |s|
    # s.id = id
    s.non_billing_request_id = non_billing_request_id
    s.investigated_at = investigated_at
    s.investigated_comment = investigated_comment
    s.investigated_id = investigated_id
  end
end

# コマンド
# rails db:seed_fu FILTER=non_billing_request_investigation_histories
# id, non_billing_request_id, investigated_at, investigated_comment, investigated_id
