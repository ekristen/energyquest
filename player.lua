function Player (initialEnergy)
  local self = {energy = initialEnergy}
  
  local addenergy = function (e)
    self.energy = self.energy + e
  end
  
  local removeEnergy = function (e)
    self.energy = self.energy - e
  end
  
  local getEnergy = function ()
    return self.energy
  end
  
  return {
    addEnergy = addEnergy,
    removeEnergy = removeEnergy,
    getEnergy = getEnergy
  }
end

