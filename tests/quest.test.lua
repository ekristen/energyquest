package.path = "../?.lua;" .. package.path

require('luaunit')
quest = require('quest')

TestQuest = {}

function TestQuest:setUp()
  self.quest = Quest.new()
  self.level = self.quest.getLevel()
  self.player = self.quest.getPlayer()
end

function TestQuest:testMoveResponseInvalidOption()
  assertEquals( self.quest:processResponse("i"), -1 )
end

function TestQuest:testMoveResponseQuitOption1()
  assertEquals( self.quest:processResponse("q"), 99 )
end

function TestQuest:testMoveResponseQuitOption2()
  assertEquals( self.quest:processResponse("Q"), 99 )
end

function TestQuest:testMoveResponseNoFood()
  self.level:setPlayerPositionX(0)
  self.level:setPlayerPositionY(0)
  self.level:setFoodPositionX(5)
  self.level:setFoodPositionY(5)
  assertEquals( self.quest:processResponse("r"), 12)
end

function TestQuest:testMoveResponseNoFoodEnergyLevel()
  self.level:setPlayerPositionX(0)
  self.level:setPlayerPositionY(0)
  self.level:setFoodPositionX(5)
  self.level:setFoodPositionY(5)
  self.player:setEnergy(50)
  self.quest:processResponse("r")
  assertEquals( self.player:getEnergy(), 49)
end

function TestQuest:testMoveResponseFoodFound()
  self.level:setPlayerPositionX(0)
  self.level:setPlayerPositionY(0)
  self.level:setFoodPositionX(1)
  self.level:setFoodPositionY(0)
  assertEquals( self.quest:processResponse("r"), 16)
end

function TestQuest:testMoveResponseFoodFoundEnergyLevel()
  self.level:setPlayerPositionX(0)
  self.level:setPlayerPositionY(0)
  self.level:setFoodPositionX(1)
  self.level:setFoodPositionY(0)
  self.player:setEnergy(50)
  self.quest:processResponse("r")
  assertEquals( self.player:getEnergy(), 70)
end

function TestQuest:testMoveResponseInvalidMove()
  self.level:setPlayerPositionX(0)
  self.level:setPlayerPositionY(0)
  assertEquals( self.quest:processResponse("l"), 20 )
end


LuaUnit:run()