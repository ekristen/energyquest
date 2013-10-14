package.path = "../?.lua;" .. package.path

require('luaunit')
player = require('player')

TestPlayer = {}

function TestPlayer:setUp()
  self.player = Player.new(50)
end

function TestPlayer:testInitialEnergyLevel()
  assertEquals( self.player:getEnergy(), 50 )
end

function TestPlayer:testAddingEnergy()
  self.player:setEnergy(50)
  self.player:addEnergy(20)
  assertEquals( self.player:getEnergy(), 70 )
end

function TestPlayer:testRemovingEnergy()
  self.player:setEnergy(50)
  self.player:removeEnergy(1)
  assertEquals( self.player:getEnergy(), 49 )
end

function TestPlayer:testSetEnergy()
  self.player:setEnergy(77)
  assertEquals( self.player:getEnergy(), 77 )
end

LuaUnit:run()