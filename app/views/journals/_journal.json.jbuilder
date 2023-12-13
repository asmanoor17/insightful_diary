json.extract! journal, :id, :content, :users_first_name, :created_at, :updated_at
json.url journal_url(journal, format: :json)
