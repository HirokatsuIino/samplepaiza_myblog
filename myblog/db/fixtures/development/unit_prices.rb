require 'csv'

csv = CSV.read('db/fixtures/development/unit_prices.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  relation_type_id = line[1]
  value = line[2]
  billing_code = line[3]
  refund_code = line[4]
  billing_invoice_name = line[5]
  refund_invoice_name = line[6]
  campagin_flg = line[7]



  UnitPrice.seed_once(:id) do |s|
    # s.id = id
    s.relation_type_id = relation_type_id
    s.value = value
    s.billing_code = billing_code
    s.refund_code = refund_code
    s.billing_invoice_name = billing_invoice_name
    s.refund_invoice_name = refund_invoice_name
    s.campagin_flg = campagin_flg
  end
end

# コマンド
# rails db:seed_fu FILTER=unit_prices