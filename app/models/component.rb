class Component < ApplicationRecord
  belongs_to :team
  has_many :sub_components
end
