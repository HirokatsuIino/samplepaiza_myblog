require 'csv'

csv = CSV.read('db/fixtures/development/service_term_types.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  name = line[1]
  value = line[2]

  ServiceTermTypes.seed_once(:id) do |s|
    # s.id = id
    s.name = name
  end
end

# コマンド
# rails db:seed_fu FILTER=service_term_types
#
# id, name
#