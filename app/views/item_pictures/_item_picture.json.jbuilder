json.extract! item_picture, :id, :name, :description, :author, :educational, :relevant, :q, :s, :notes, :picture, :explicit, :created_at, :updated_at
json.url item_picture_url(item_picture, format: :json)
