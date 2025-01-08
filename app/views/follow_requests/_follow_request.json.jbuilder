json.extract! follow_request, :id, :status, :recipient_id, :sender_id, :created_at, :updated_at
json.url follow_request_url(follow_request, format: :json)
