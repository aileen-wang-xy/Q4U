json.extract! post, :id, :user_id, :service_type, :spot_name, :address, :fee, :start_time, :end_time, :description, :contact_name, :contactno, :contact_email, :constraint, :created_at, :updated_at
json.url post_url(post, format: :json)
