require("player")
require("level")

player = new Player.new(50);
level = Level.new(5)

print("Welcome to Energy Quest!")
print("")
print("The rules are simple, select a direction to move (left, right, up, down)")
print("Each move costs you 1 energy point, you start with 50.")
print("If you enter a square that has a food item, you gain 20 energy points")
print("Each an energy level of 100 or greater and you win")
print("If you reach an energy level of 0, you loose.")
print("")
print("Type Q or q at any time to exit the game!")
print("")

local response

repeat
  io.write("Which direction do you want to move? ")
  io.write("(l, r, u, d): ")
  io.flush()
  response = io.read()

  if (response == "l" or response == "r" or response == "u" or response == "d") then
    moveresponse = level:movePlayer(response, player)
    print(moveresponse)
    if (moveresponse == 1) then
      Player:removeEnergy(1)
      print("Move successful, but no food found.")
      print(" Energy level: ", player:getEnergy())
    elseif (moveresponse == 2) then
      Player:addEnergy(20)
      print("Move successful, food was found!")
      print(" Energy level: ", player:getEnergy())
    elseif (moveresponse == -1) then
      print("")
      print("Whoops, that is an invalid move, you've hit a wall, please try another direction")
      print("")
    end
  else
    print("")
    print("Whoops, that is an invalid option.")
    print("")
  end

until response == "q" or response == "Q"

print("")
print("Thanks for playing, goodbye!")