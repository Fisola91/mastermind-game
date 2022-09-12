require_relative "constant_variable"


class UnknownColorError < StandardError; end
class NumberOfColorsError < StandardError; end

class ValidateInput

  include ColorsAndCodeNumber
  def self.call(colors)

      unless colors.all? { |guess| COLORS.include?(guess) }
          raise UnknownColorError
      end

    # rescue UnknownColorError
    #   puts "Invalid input, kindly start again!"
    #   exit
    # end

      if colors.length != NUMBER_CODE
        raise NumberOfColorsError
      end
    #   raise
    # rescue NumberOfColorsError
    #   puts "Ensure you enter four colors, start again!"
    #   exit









    # return
    # rescue UnknownColorError
    #   raise

  end
end
# def gem_version(name)
#   Gem.loaded_specs[name].version
# rescue NoMethodError
#   raise NoMethodError, "No gem loaded for #{name}"
# end
# end
