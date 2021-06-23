class AnotherAppRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { reading: :otherdb, writing: :otherdb }

  def normalized_attributes
    result = {}

    attributes.each do |k, v|
      result[k.normalize_for_db] = v
    end

    result
  end
end
