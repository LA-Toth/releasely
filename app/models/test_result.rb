class TestResult < ApplicationRecord
  belongs_to :release
  belongs_to :split, class_name: 'TestSplit'
  belongs_to :config, class_name: 'TestConfig'
  belongs_to :asssignee, class_name: 'User'

  def percent
    (tests_passed + tests_skipped) / tests_count
  end
end
