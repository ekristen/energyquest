package.path = "../?.lua;" .. package.path

require('luaunit')
level = require('level')

TestLevel = {}

print ("Level Tests")

function TestLevel:setUp()
  self.level = Level.new(5)
end

function TestLevel:testInitialGridSize()
  assertEquals( self.level:getGridSize(), 25 )
end

function TestLevel:testPlayerFoodLocationNotTheSame()
  playerPosition = self.level:getPlayerPosition()
  foodPosition = self.level:getFoodPosition()
  assertNotEquals( playerPosition, foodPosition )
end

function TestLevel:testMovePlayerLeftIntoWall()
  self.level:setPlayerPositionX(0)
  self.level:setPlayerPositionY(0)
  assertEquals( self.level:movePlayer("l"), -1 )
end

function TestLevel:testMovePlayerRightIntoWall()
  self.level:setPlayerPositionX(5)
  self.level:setPlayerPositionY(0)
  assertEquals( self.level:movePlayer("r"), -1 )
end

function TestLevel:testMovePlayerUpIntoWall()
  self.level:setPlayerPositionX(0)
  self.level:setPlayerPositionY(0)
  assertEquals( self.level:movePlayer("u"), -1 )
end

function TestLevel:testMovePlayerDownIntoWall()
  self.level:setPlayerPositionX(5)
  self.level:setPlayerPositionY(5)
  assertEquals( self.level:movePlayer("d"), -1 )
end

function TestLevel:testMovePlayerNoFoodFound()
  self.level:setPlayerPositionX(0)
  self.level:setPlayerPositionY(0)
  
  self.level:setFoodPositionX(5)
  self.level:setFoodPositionY(5)
  
  assertEquals( self.level:movePlayer("d"), 1 )
end

function TestLevel:testMovePlayerWithFoodFound()
  self.level:setPlayerPositionX(0)
  self.level:setPlayerPositionY(0)
  
  self.level:setFoodPositionX(0)
  self.level:setFoodPositionY(1)
  
  assertEquals( self.level:movePlayer("d"), 2 )
end



LuaUnit:run()