require 'csv'

csv = CSV.read('db/fixtures/development/monthly_budgets.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  client_id = line[1]
  limit = line[2]
  begin_at = line[3]


  MonthlyBudget.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.limit = limit
    s.begin_at = begin_at
  end
end

# コマンド
# rails db:seed_fu FILTER=monthly_budgets
#
# id, client_id, limit, begin_at
