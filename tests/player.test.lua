package.path = "../?.lua;" .. package.path

require('luaunit')
player = require('player')

TestPlayer = {}

print ("Player Tests")

function TestPlayer:setUp()
  self.player = Player.new(50)
end

function TestPlayer:test1()
  print("Testing Initial Energy Level (Expected 50)")
  assertEquals( self.player:getEnergy(), 50 )
end


LuaUnit:run()