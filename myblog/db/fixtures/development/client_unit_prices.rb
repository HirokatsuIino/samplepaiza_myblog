require 'csv'

csv = CSV.read('db/fixtures/development/client_unit_prices.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  client_id = line[1]
  unit_price_id = line[2]
  begin_at = line[3]



  ClientUnitPrice.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.unit_price_id = unit_price_id
    s.begin_at = begin_at
  end
end

# コマンド
# rails db:seed_fu FILTER=client_unit_prices
#
# id, client_id, unit_price_id, begin_at
