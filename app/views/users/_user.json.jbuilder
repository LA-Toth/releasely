json.extract! user, :id, :username, :given_name, :family_name, :password_digest, :can_log_in, :created_at, :updated_at
json.url user_url(user, format: :json)
