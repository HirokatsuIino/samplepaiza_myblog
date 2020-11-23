require 'csv'

csv = CSV.read('db/fixtures/development/document_request_meal_types.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  document_request_id = line[1]
  meal_type_id = line[2]


  DocumentRequestMealType.seed_once(:id) do |s|
    # s.id = id
    s.document_request_id = document_request_id
    s.meal_type_id = meal_type_id
  end
end

# コマンド
# rails db:seed_fu FILTER=document_request_meal_types
#
# id, document_request_id, meal_type_id
