json.array!(@publications) do |publication|
  json.extract! publication, :title, :content
  json.url publication_url(publication, format: :json)
end
