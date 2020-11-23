require 'csv'

csv = CSV.read('db/fixtures/development/basic_informations.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  corporate_name = line[1]
  address = line[2]
  tel = line[3]
  email = line[4]
  fax = line[5]
  url = line[6]
  client_id = line[7]
  office_id = line[8]
  identical_for_clientflag = line[9]



  BasicInformation.seed_once(:id) do |s|
    # s.id = id
    s.corporate_name = corporate_name
    s.address = address
    s.tel = tel
    s.email = email
    s.fax = fax
    s.url = url
    s.client_id = client_id
    s.office_id = office_id
    s.identical_for_clientflag = identical_for_clientflag
  end
end

# コマンド
# rails db:seed_fu FILTER=basic_informations
#
# id, corporate_name, address, tel, email, fax, url, client_id, office_id, identical_for_clientflag
#