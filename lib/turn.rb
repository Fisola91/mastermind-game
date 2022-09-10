class Turn
  def initialize(passcode:)
    @passcode = passcode
  end

  def guess(colors)
    result = []
    passcode.each_with_index do |passcode_color, idx|
      if colors[idx] == passcode_color
        result << :exact
      elsif colors.include?(passcode_color)
        result << :partial
      end
    end
    result
  end

  private

  attr_reader :passcode
end
