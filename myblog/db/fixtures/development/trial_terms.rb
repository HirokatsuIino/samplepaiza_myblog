require 'csv'

csv = CSV.read('db/fixtures/development/trial_terms.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |line|
  # id = line[0]
  office_id = line[1]
  begin_at = line[1]
  end_at = line[1]

  TrialTerm.seed_once(:id) do |s|
    # s.id = id
    s.office_id = office_id
    s.begin_at = begin_at
    s.end_at = end_at
  end
end

# コマンド
# rails db:seed_fu FILTER=trial_terms
#
# id, office_id, begin_at, end_at
#