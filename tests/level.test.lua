package.path = "../?.lua;" .. package.path

require('luaunit')
level = require('level')

TestLevel = {}

print ("Level Tests")

function TestLevel:setUp()
  self.level = Level.new(5)
end

function TestLevel:test1()
  print("Testing Initial Grid Size")
  assertEquals( self.level:getGridSize(), 25 )
end

function TestLevel:test2()
  print("Testing Player Location and Food Location")
  playerPosition = self.level:getPlayerPosition()
  foodPosition = self.level:getFoodPosition()
  print("Player Position: " .. playerPosition)
  print("Food Position: " .. foodPosition)
  assertNotEquals( playerPosition, foodPosition )
end

LuaUnit:run()