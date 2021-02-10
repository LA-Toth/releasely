json.extract! issue, :id, :issue_key, :title, :state, :blocker, :last_updated_at, :last_reply_at, :assignee_id, :issue_category,
              :created_at, :updated_at
json.url issue_url(issue, format: :json)
