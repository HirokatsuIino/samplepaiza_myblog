require 'csv'

csv = CSV.read('db/fixtures/development/document_requests.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  name = line[1]
  name_hira = line[2]
  tel = line[3]
  email = line[4]
  post_code = line[5]
  prefectures_id = line[6]
  municipality_id = line[7]
  etc_address = line[8]
  person_eat_id = line[9]
  tel_other = line[10]
  scd_site_code = line[11]
  access_at = line[12]
  devise = line[13]
  scd_site_lp = line[14]
  form = line[15]
  admin_comment = line[16]
  area_code_id = line[17]


  DocumentRequest.seed_once(:id) do |s|
    # s.id = id
    s.name = name
    s.name_hira = name_hira
    s.tel = tel
    s.email = email
    s.post_code = post_code
    s.prefectures_id = prefectures_id
    s.municipality_id = municipality_id
    s.etc_address = etc_address
    s.person_eat_id = person_eat_id
    s.tel_other = tel_other
    s.scd_site_code = scd_site_code
    s.access_at = access_at
    s.devise = devise
    s.scd_site_lp = scd_site_lp
    s.form = form
    s.admin_comment = admin_comment
    s.area_code_id = area_code_id
  end
end

# コマンド
# rails db:seed_fu FILTER=document_requests
#
# id, name, name_hira, tel, email, post_code, prefectures_id, municipality_id, etc_address, person_eat_id, order_plan_category_id, tel_other, scd_site_code, access_at, devise, scd_site_lp, form, admin_comment, area_code_id
#
