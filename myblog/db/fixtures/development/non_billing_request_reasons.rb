require 'csv'

csv = CSV.read('db/fixtures/development/non_billing_request_reasons.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  name = line[1]


  NonBillingRequestReason.seed_once(:id) do |s|
    # s.id = id
    s.name = name
  end
end

# コマンド
# rails db:seed_fu FILTER=non_billing_request_reasons
# id, name
