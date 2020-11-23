require 'csv'

csv = CSV.read('db/fixtures/development/billing_settings.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  client_id = line[1]
  billing_method_id = line[2]
  duplication_non_billing_months = line[3]
  comment = line[4]


  BillingSetting.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.billing_method_id = billing_method_id
    s.duplication_non_billing_months = duplication_non_billing_months
  end
end

# コマンド
# rails db:seed_fu FILTER=billing_settings
#
# id, client_id, billing_method_id, duplication_non_billing_months, comment
#