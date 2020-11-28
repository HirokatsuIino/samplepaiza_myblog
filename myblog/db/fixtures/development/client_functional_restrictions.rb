require 'csv'

csv = CSV.read('db/fixtures/development/client_functional_restrictions.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  client_id = line[1]
  cannot_see_and_edit_publishing_and_area_set_flag = line[2]
  non_billing_requestable_user_category_id = line[3]


  ClientFunctionalRestriction.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.cannot_see_and_edit_publishing_and_area_set_flag = cannot_see_and_edit_publishing_and_area_set_flag
    s.non_billing_requestable_user_category_id = non_billing_requestable_user_category_id
  end
end

# コマンド
# rails db:seed_fu FILTER=client_functional_restrictions
#
# id, client_id, cannot_see_and_edit_publishing_and_area_set_flag, non_billing_requestable_user_category_id