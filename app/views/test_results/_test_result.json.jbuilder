json.extract! test_result, :id, :ext_id, :tests_count, :tests_passed, :tests_failed, :tests_skipped, :release_id, :split_id,
              :config_id, :asssignee_id, :created_at, :updated_at
json.url test_result_url(test_result, format: :json)
