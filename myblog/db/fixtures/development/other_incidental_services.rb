require 'csv'

csv = CSV.read('db/fixtures/development/other_incidental_services.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  name = line[1]


  OtherIncidentalService.seed_once(:id) do |s|
    # s.id = id
    s.name = name
  end
end

# コマンド
# rails db:seed_fu FILTER=other_incidental_services
# id, name
