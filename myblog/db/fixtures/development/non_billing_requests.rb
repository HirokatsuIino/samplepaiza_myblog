require 'csv'

csv = CSV.read('db/fixtures/development/non_billing_requests.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  order_id = line[1]
  non_billing_request_reason_id = line[2]
  request_reason_detail = line[3]
  first_contacted_at = line[4]
  second_contacted_at = line[5]
  third_contacted_at = line[6]
  begin_at = line[7]
  admin_sms_comment = line[8]
  judge_admin_id = line[9]
  approval_at = line[10]
  denial_at = line[11]
  relation_type_change_date_at = line[12]
  judge_reason_for_user = line[13]
  admin_comment = line[14]

  NonBillingRequest.seed_once(:id) do |s|
    # s.id = id
    s.order_id = order_id
    s.non_billing_request_reason_id = non_billing_request_reason_id
    s.request_reason_detail = request_reason_detail
    s.first_contacted_at = first_contacted_at
    s.second_contacted_at = second_contacted_at
    s.third_contacted_at = third_contacted_at
    s.begin_at = begin_at
    s.admin_sms_comment = admin_sms_comment
    s.judge_admin_id = judge_admin_id
    s.approval_at = approval_at
    s.denial_at = denial_at
    s.relation_type_change_date_at = relation_type_change_date_at
    s.judge_reason_for_user = judge_reason_for_user
    s.admin_comment = admin_comment
  end
end

# コマンド
# rails db:seed_fu FILTER=non_billing_requests
# id, order_id, non_billing_request_reason_id, request_reason_detail, first_contacted_at, second_contacted_at, third_contacted_at, begin_at, admin_comment, judge_admin_id, approval_at, denial_at, relation_type_change_date_at, judge_reason_for_user, admin_comment
