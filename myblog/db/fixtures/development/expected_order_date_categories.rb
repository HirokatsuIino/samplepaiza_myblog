require 'csv'

csv = CSV.read('db/fixtures/development/expected_order_date_categories.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  expected_order_date_category_name = line[1]


  ExpectedOrderDateCategory.seed_once(:id) do |s|
    # s.id = id
    s.expected_order_date_category_name = expected_order_date_category_name
  end
end

# コマンド
# rails db:seed_fu FILTER=expected_order_date_categories
#
# id, expected_order_date_category_name
