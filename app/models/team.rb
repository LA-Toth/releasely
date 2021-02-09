class Team < ApplicationRecord
  NO_TEAM = '-NO-TEAM-'.freeze

  belongs_to :lead, class_name: 'User'
end
