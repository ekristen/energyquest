require("player")
require("level")

Quest = {}
Quest.__index = Quest;

function Quest.new (initialEnergy, initialSize)
  local self = setmetatable({}, Quest)

  player = Player.new(50);
  level = Level.new(5)

  self.player = player
  self.level = level

  return self
end

function Quest.getPlayer(self)
  return player
end

function Quest.getLevel(self)
  return level
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
    level:showPlayerMap()

    io.write("Which direction do you want to move? ")
    io.write("(l, r, u, d): ")
    io.flush()
    response = io.read()

    qr = Quest:processResponse(response)
    if qr == -1 then
      print("")
      print("Whoops, that is an invalid option.")
      print("")
    elseif qr == 12 then
      print(":( You moved, but no food was found. Your Energy Level: " .. player:getEnergy())
    elseif qr == 16 then
      print(":) You found food! Your Energy level: " .. player:getEnergy())
    elseif qr == 20 then
      print("!! You've hit a wall, choose another direction.")
    elseif qr == 50 then
      print("")
      print("WINNER! Congratuations you've just completed your first Energy Quest!")
      print("")
      os.exit()
    elseif qr == 60 then
      print("")
      print("GAME OVER! Unfortunately your Energy Quest bested you, please try again!")
      print("")
      os.exit()
    elseif qr == 99 then
      print("")
      print("Thanks for playing! Goodbye!")
      print("")
      os.exit()
    end
  until response == "q" or response == "Q"
end

function Quest.processResponse(self, response)
  if (response == "l" or response == "r" or response == "u" or response == "d") then
    moveresponse = level:movePlayer(response)
    if (moveresponse == 1) then
      player:removeEnergy(1)

      if player:getEnergy() <= 0 then
        return 60
      end

      return 12
    elseif (moveresponse == 2) then
      player:addEnergy(20)

      if player:getEnergy() >= 100 then
        return 50
      end

      return 16
    elseif (moveresponse == -1) then
      return 20
    end
  elseif response == "q" or response == "Q" then
    return 99
  else
    return -1
  end

end

function Quest.run(self)
  print("Welcome to Energy Quest!")
  print("")

  quest = Quest:new()

  quest:instructions()

  quest:response()
end
