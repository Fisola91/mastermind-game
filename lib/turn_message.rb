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
    elsif result == []
      "Incorrect guess"
    elsif result == [:partial, :partial, :partial, :partial]
      "Four colors guessed at the wrong position"
    elsif result == [:partial, :partial, :partial]
      "Three colors guessed at the wrong position"
    elsif result == [:partial, :partial]
      "Two colors guessed at the wrong position"
    elsif result == [:partial]
      "One color guessed at the wrong position"
    else
      "Result message not implemented: #{result.inspect}"
    end
  end
end
