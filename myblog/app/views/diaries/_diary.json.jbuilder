json.extract! diary, :id, :content, :created_at, :updated_at
json.url diary_url(diary, format: :json)
