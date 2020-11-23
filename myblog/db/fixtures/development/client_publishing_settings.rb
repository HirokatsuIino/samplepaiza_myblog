require 'csv'

csv = CSV.read('db/fixtures/development/client_publishing_settings.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  client_id = line[1]
  comment = line[2]



  ClientPublishingSetting.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.comment = comment
  end
end

# コマンド
# rails db:seed_fu FILTER=client_publishing_settings
#
# id, client_id, comment