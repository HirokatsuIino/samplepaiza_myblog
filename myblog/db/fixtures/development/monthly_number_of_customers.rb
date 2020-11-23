require 'csv'

csv = CSV.read('db/fixtures/development/monthly_number_of_customers.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  limit = line[1]
  begin_at = line[2]
  client_id = line[3]


  MonthlyNumberOfCustomer.seed_once(:id) do |s|
    # s.id = id
    s.limit = limit
    s.begin_at = begin_at
    s.client_id = client_id
  end
end

# コマンド
# rails db:seed_fu FILTER=monthly_number_of_customers
#
# id, limit, begin_at, client_id
