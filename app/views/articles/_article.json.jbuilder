json.extract! article, :id, :title, :text, :created_at, :updated_at
json.url article_url(article, format: :json)
