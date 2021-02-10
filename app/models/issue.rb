class Issue < ApplicationRecord
  CATEGORY_UNKNOWN = 0
  CATEGORY_EXT = 1
  CATEGORY_PRODUCT = 2
  CATEGORY_QE = 3

  belongs_to :assignee, class_name: 'User'
end
