require 'csv'

csv = CSV.read('db/fixtures/development/order_unit_categories.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  name = line[1]


  OrderUnitCategory.seed_once(:id) do |s|
    # s.id = id
    s.name = name
  end
end

# コマンド
# rails db:seed_fu FILTER=order_unit_categories
# id, name
