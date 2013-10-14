function Level (initialSize)
  local self = {size = initialSize}

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

