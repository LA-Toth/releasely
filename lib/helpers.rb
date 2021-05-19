class String
  DOWNCASE_REGEX = Regexp.new('^\\p{Lower}*$'.force_encoding('UTF-8'))
  UPCASE_REGEX = Regexp.new('^\\p{Upper}*$'.force_encoding('UTF-8'))

  def upcase_only?
    !match(UPCASE_REGEX).nil?
  end

  def downcase_only?
    !match(DOWNCASE_REGEX).nil?
  end

  def normalize_for_db
    new_name = ''
    prev = ''
    sub(/[),]+$/, '').sub(/^\)+/, '').chars.each do |c|
      new_name += if c.upcase_only?
                    (prev.blank? || prev == '_' || prev.upcase_only? ? '' : '_') + c.downcase
                  else
                    c
                  end
      prev = c
    end
    new_name
  end
end

class Integer
  def bit_in?(other)
    other & self == self
  end

  def bit_set?(bit)
    self & bit == bit
  end
end
