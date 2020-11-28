require 'csv'

csv = CSV.read('db/fixtures/development/orders.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  document_request_id = line[1]
  office_id = line[2]
  unit_individual_price_id = line[3]
  unit_facility_price_id = line[4]
  unit_price_relation_type_id = line[5]
  pushed_thanks_page_action_button_id = line[6]
  order_request_no_applicate_flg = line[7]
  order_request_no_applicate_reson_id = line[8]
  relationship_types_id = line[9]


  Order.seed_once(:id) do |s|
    # s.id = id
    s.document_request_id = document_request_id
    s.office_id = office_id
    s.unit_individual_price_id = unit_individual_price_id
    s.unit_facility_price_id = unit_facility_price_id
    s.unit_price_relation_type_id = unit_price_relation_type_id
    s.pushed_thanks_page_action_button_id = pushed_thanks_page_action_button_id
    s.order_request_no_applicate_flg = order_request_no_applicate_flg
    s.order_request_no_applicate_reson_id = order_request_no_applicate_reson_id
    s.relationship_types_id = relationship_types_id
  end
end

# コマンド
# rails db:seed_fu FILTER=orders
# id, document_request_id, office_id, request_unit_price, unit_price_id, unit_price_relation_type_id, pushed_thanks_page_action_button_id, order_request_no_applicate_flg, order_request_no_applicate_reson_id, relationship_types_id
# id, document_request_id, office_id, unit_individual_price_id, unit_facility_price_id, unit_price_relation_type_id, pushed_thanks_page_action_button_id, order_request_no_applicate_flg, order_request_no_applicate_reson_id, relationship_types_id
