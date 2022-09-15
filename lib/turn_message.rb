class TurnMessage
  def self.for(result)
    # Use while loop to iterate here --- LATER
    if result == [:exact, :exact, :exact, :exact]
      "Congratulations!"
    elsif result == [:exact]
      "One correct guess at the exact position"
    elsif result == [:exact, :exact]
      "Two correct guess at the exact position"
    elsif result == [:exact, :exact, :exact]
      "Three correct guess at the exact position"
    elsif result = [:partial, :partial, :partial, :partial]
      "Four colors guessed at the wrong position"
    elsif result == []
      "Incorrect guess"
    else
      "Result message not implemented: #{result.inspect}"
    end
  end
end
