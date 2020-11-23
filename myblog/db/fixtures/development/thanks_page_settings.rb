require 'csv'

csv = CSV.read('db/fixtures/development/thanks_page_settings.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  client_id = line[1]
  office_id = line[2]
  document_pdf = line[3]
  tel = line[4]
  url = line[5]
  identical_for_clientflag = line[6]
  thanks_action_id = line[7]
  order_page_url = line[8]
  comment = line[9]
  business_hour = line[10]
  holiday = line[11]
  shortest_use_start_day = line[12]

  ThanksPageSetting.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.office_id = office_id
    s.document_pdf = document_pdf
    s.tel = tel
    s.url = url
    s.identical_for_clientflag = identical_for_clientflag
    s.thanks_action_id = thanks_action_id
    s.order_page_url = order_page_url
    s.comment = comment
    s.business_hour = business_hour
    s.holiday = holiday
    s.shortest_use_start_day = shortest_use_start_day
  end
end

# コマンド
# rails db:seed_fu FILTER=thanks_page_settings
#
# id, client_id, office_id, document_pdf, tel, url, identical_for_clientflag, thanks_action_id, order_page_url, comment, business_hour, holiday, shortest_use_start_day
#