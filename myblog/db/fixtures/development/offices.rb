require 'csv'

csv = CSV.read('db/fixtures/development/offices.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  client_id = line[1]
  name = line[2]
  cl_defied_ofice_code = line[3]
  comment = line[4]
  unpublishing_at = line[5]


  Office.seed_once(:id) do |s|
    # s.id = id
    s.client_id = client_id
    s.name = name
    s.cl_defied_ofice_code = cl_defied_ofice_code
    s.comment = comment
    s.unpublishing_at = unpublishing_at
  end
end

# コマンド
# rails db:seed_fu FILTER=offices
# id, client_id, name, cl_defied_code, comment, unpublishing_at
