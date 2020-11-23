require 'csv'

csv = CSV.read('db/fixtures/development/relationships.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  relationship_name = line[1]
  relationship_id = line[2]

  Relationship.seed_once(:id) do |s|
    # s.id = id
    s.relationship_name = relationship_name
    s.relationship_id = relationship_id
  end
end

# コマンド
# rails db:seed_fu FILTER=relationships
# id, relationship_name, relationship_id
#
# id, client_publishing_setting_id, begin_at, end_at, flg
#