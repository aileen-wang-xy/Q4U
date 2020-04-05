json.extract! review, :id, :reviewer_id, :be_reviewed_id, :deal_id, :rating, :comment, :created_at, :updated_at
json.url review_url(review, format: :json)
