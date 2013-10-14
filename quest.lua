Quest = {}
Quest.__index = Quest;

function Quest.new ()
  local self = setmetatable({}, Quest)
  
  return self
end


function Quest.instructions(self)
  print("Instructions: ")
  print("")
  print("You've spawned into a room, it is a box, you are in a random position. A food item is at a random position")
  print("The objective of the game is to find food. Each food item is worth 20 energy points.")
  print("Each move will cost you 1 energy point. Get to 100 energy points to win, 0 to lose.")
  print("")
  print("Game Controls:")
  print("")
  print("l - Move Left (West)")
  print("r - Move Right (East)")
  print("u - Move Up (North)")
  print("d - Move Down (South)")
  print("")
  print("Type q or Q at any time to quit the game.")
  print("")
  print("Good luck on your quest!")
  print("")
end

function Quest.response(self)
  local response

  repeat
    io.write("Which direction do you want to move? ")
    io.write("(l, r, u, d): ")
    io.flush()
    response = io.read()

    Quest:processResponse(response)
  until response == "q" or response == "Q"
end

function Quest.processResponse(self, response)
  if (response == "l" or response == "r" or response == "u" or response == "d") then
    moveresponse = level:movePlayer(response)
    if (moveresponse == 1) then
      player:removeEnergy(1)
      print(":( You moved, but no food was found. Your Energy Level: " .. player:getEnergy())
    elseif (moveresponse == 2) then
      player:addEnergy(20)
      print(":) You found food! Your Energy level: " .. player:getEnergy())
    elseif (moveresponse == -1) then
      print("!! You've hit a wall, choose another direction.")
    end

    if player:getEnergy() >= 100 then
      print("")
      print("WINNER! Congratuations you've just completed your first Energy Quest!")
      print("")
      os.exit() 
    elseif player:getEnergy() <= 0 then
      print("")
      print("GAME OVER! Unfortunately your Energy Quest bested you, please try again!")
      print("")
      os.exit()
    end
  elseif response == "q" or response == "Q" then
    print("")
    print("Thanks for playing! Goodbye!")
    print("")
    os.exit()
  else
    print("")
    print("Whoops, that is an invalid option.")
    print("")
  end

end

function Quest.run(self)
  require("player")
  require("level")

  player = Player.new(50);
  level = Level.new(5)

  print("Welcome to Energy Quest!")
  print("")
  Quest:instructions()

  Quest:response()
end
