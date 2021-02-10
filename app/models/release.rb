class Release < ApplicationRecord
  belongs_to :version, class_name: 'ReleaseVersion'
  belongs_to :product
end
