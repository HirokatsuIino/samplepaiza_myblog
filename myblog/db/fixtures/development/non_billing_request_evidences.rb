require 'csv'

csv = CSV.read('db/fixtures/development/non_billing_request_evidences.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  non_billing_request_id = line[1]
  file = line[2]


  NonBillingRequestEvidence.seed_once(:id) do |s|
    # s.id = id
    s.non_billing_request_id = non_billing_request_id
    s.file = file
  end
end

# コマンド
# rails db:seed_fu FILTER=non_billing_request_evidences
# id, non_billing_request_id, file
