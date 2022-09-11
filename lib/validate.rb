require_relative "constant_variable"

class UnknownColorError < StandardError; end

class NumberOfColorsError < StandardError; end

class ValidateInput

  include ColorsAndCodeNumber
  def self.call(colors)

    raise UnknownColorError, NumberOfColorsError
  rescue UnknownColorError
    unless colors.all? { |guess| COLORS.include?(guess) }
      return
    end

  rescue NumberOfColorsError
    unless colors.length == NUMBER_CODE
      return
    end
      # rescue NumberOfColorsError
      #   puts "Ensure that the length of the guesses is four."
  end
end
# def gem_version(name)
#   Gem.loaded_specs[name].version
# rescue NoMethodError
#   raise NoMethodError, "No gem loaded for #{name}"
# end
# end
