require 'csv'

csv = CSV.read('db/fixtures/development/thanks_page_action_buttons.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  title = line[1]
  url = line[2]

  ThanksPageActionButton.seed_once(:id) do |s|
    # s.id = id
    s.title = title
    s.url = url
  end
end

# コマンド
# rails db:seed_fu FILTER=thanks_page_action_buttons
#
# id, title, url
#