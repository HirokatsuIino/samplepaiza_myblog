require 'csv'

csv = CSV.read('db/fixtures/development/duplicate_orders.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  non_billing_request_id = line[1]
  order_id = line[2]


  DuplicateOrder.seed_once(:id) do |s|
    # s.id = id
    s.non_billing_request_id = non_billing_request_id
    s.order_id = order_id
  end
end

# コマンド
# rails db:seed_fu FILTER=duplicate_orders
#
# id, non_billing_request_id, order_id
