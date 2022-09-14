class TurnMessage
  def self.for(result)
    if result == [:exact, :exact, :exact, :exact]
      "Congratulations!"
    elsif result == [:exact]
      "One correct guess at the exact position"
    elsif result == [:exact, :exact]
      "Two correct guess at the exact position"
    elsif result == [:exact, :exact, :exact]
      "Three correct guess at the exact position"
    elsif result == []
      "Incorrect guess"
    else
      "Result message not implemented: #{result.inspect}"
    end
  end
end
