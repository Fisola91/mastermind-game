
class UnknownColorError < StandardError; end

class NumberOfColorsError < StandardError; end

class ValidateInput

  include ColorsAndCodeNumber
  def self.call(colors)
    unless colors.all? { |guess| COLORS.include?(guess) }
      raise UnknownColorError
    end
    if colors.length != NUMBER_CODE
      raise NumberOfColorsError
    else
      nil
    end
  end
end
