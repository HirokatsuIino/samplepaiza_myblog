require 'csv'

csv = CSV.read('db/fixtures/development/contract_billing_unit_prices.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  client_id = line[1]
  contract_billing_product_code = line[2]
  contract_billing_invoice_display_name = line[3]
  value = line[4]
  service_period_type_id = line[5]


  ContractBillingUnitPrice.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.contract_billing_product_code = contract_billing_product_code
    s.contract_billing_invoice_display_name = contract_billing_invoice_display_name
    s.value = value
    s.service_period_type_id = service_period_type_id
  end
end

# コマンド
# rails db:seed_fu FILTER=contract_billing_unit_prices
#
# iid, client_id, contract_billing_product_code, contract_billing_invoice_display_name, value, service_period_type_id
