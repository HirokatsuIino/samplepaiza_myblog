require 'csv'

csv = CSV.read('db/fixtures/development/publishing_fees.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  client_id = line[1]
  monthly_basic_publication_fee_product_code = line[2]
  monthly_basic_publication_fee_invoice_display_name = line[3]
  value = line[4]

  PublishingFee.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.monthly_basic_publication_fee_product_code = monthly_basic_publication_fee_product_code
    s.monthly_basic_publication_fee_invoice_display_name = monthly_basic_publication_fee_invoice_display_name
    s.value = value
  end
end

# コマンド
# rails db:seed_fu FILTER=publishing_fees
#
# id, client_id, value
# id, client_id, value, monthly_basic_publication_fee_product_code, monthly_basic_publication_fee_invoice_display_name
#