json.extract! item_video, :id, :name, :description, :author, :educational, :relevant, :q, :s, :notes, :video, :explicit, :created_at, :updated_at
json.url item_video_url(item_video, format: :json)
