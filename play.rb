require_relative "./lib/mastermind"
game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"])
game.start
