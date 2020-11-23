require 'csv'

csv = CSV.read('db/fixtures/development/publishing_fees.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  client_id = line[1]
  value = line[2]

  PublishingFee.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.value = value
  end
end

# コマンド
# rails db:seed_fu FILTER=publishing_fees
#
# id, client_id, value
#