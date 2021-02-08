class User < ApplicationRecord
  NOBODY = '-Nobody-'.freeze

  def full_name
    family_name ? "#{given_name} #{family_name}" : given_name
  end

  def disabled
    !can_log_in
  end

  def self.unknown_user
    find_by(username: NOBODY)
  end
end
