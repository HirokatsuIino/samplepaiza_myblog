require 'csv'

csv = CSV.read('db/fixtures/development/relationship_types.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  relationship_type_name = line[1]

  RelationshipType.seed_once(:id) do |s|
    # s.id = id
    s.relationship_type_name = relationship_type_name
  end
end

# コマンド
# rails db:seed_fu FILTER=relationship_types
# id, relationship_name, relationship_id
#
# id, relationship_type_name
#