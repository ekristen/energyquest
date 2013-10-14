Player = {}
Player.__index = Player;

function Player.new (initialEnergy)
  local self = setmetatable({}, Player)

  self.energy = initialEnergy

  return self
end


function Player.addEnergy (self, e)
  self.energy = self.energy + e
end

function Player.removeEnergy (self, e)
  self.energy = self.energy - e
end

function Player.getEnergy (self)
  return self.energy
end
