require 'csv'

csv = CSV.read('db/fixtures/development/contract_billing_unit_prices.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  client_id = line[1]
  value = line[2]
  service_period_type_id = line[3]


  ContractBillingUnitPrice.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.value = value
    s.service_period_type_id = service_period_type_id
  end
end

# コマンド
# rails db:seed_fu FILTER=contract_billing_unit_prices
#
# id, client_id, value, service_period_type_id
