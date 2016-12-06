json.extract! requests, :id, :book_title, :publishing_date, :author, :desired_price, :language_of_edition, :created_at, :updated_at
json.url requests_url(product, format: :json)




 