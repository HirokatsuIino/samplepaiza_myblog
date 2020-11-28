require 'csv'

csv = CSV.read('db/fixtures/development/notification_recipients.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  client_id = line[1]
  office_id = line[2]
  name_emails_id = line[3]
  identical_for_clientflag = line[4]


  NotificationRecipient.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.office_id = office_id
    s.name_emails_id = name_emails_id
    s.identical_for_clientflag = identical_for_clientflag
  end
end

# コマンド
# rails db:seed_fu FILTER=notification_recipients
# id, client_id, office_id, name_emails_id, identical_for_clientflag
