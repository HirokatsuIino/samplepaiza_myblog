require 'csv'

csv = CSV.read('db/fixtures/development/office_unique_items.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  id = line[0]
  office_id = line[1]
  sl_fureai_flag = line[2]


  OfficeUniqueItem.seed_once(:id) do |s|
    # s.id = id
    s.office_id = office_id
    s.sl_fureai_flag = sl_fureai_flag
  end
end

# コマンド
# rails db:seed_fu FILTER=office_unique_items
# id, office_id, sl_fureai_flag
