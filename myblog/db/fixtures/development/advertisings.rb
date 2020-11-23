require 'csv'

csv = CSV.read('db/fixtures/development/advertisings.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  client_id = line[1]
  office_id = line[2]
  title = line[3]
  store_name = line[4]
  logo = line[5]
  image = line[6]
  appeal_point_1 = line[7]
  appeal_point_2 = line[8]
  appeal_point_3 = line[9]
  appeal_point_4 = line[10]
  supplement = line[11]
  identical_for_clientflag = line[12]


  Advertising.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.office_id = office_id
    s.title = title
    s.store_name = store_name
    s.logo = logo
    s.image = image
    s.appeal_point_1 = appeal_point_1
    s.appeal_point_2 = appeal_point_2
    s.appeal_point_3 = appeal_point_3
    s.appeal_point_4 = appeal_point_4
    s.supplement = supplement
    s.identical_for_clientflag = identical_for_clientflag
  end
end

# コマンド
# rails db:seed_fu FILTER=advertisings
#
# id, client_id, office_id, title, store_name, logo, image, appeal_point_1, appeal_point_2, appeal_point_3, appeal_point_4, supplement, identical_for_clientflag
#