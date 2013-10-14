Level = {}
Level.__index = Level

function Level.new(initialSize)
  local self = setmetatable({}, Level)
  self.size = initialSize

  self.gridSize = initialSize * initialSize

  self.grid = {}

  -- Initialize our grid
  for i=0,self.size do
    self.grid[i] = {}
    for j=0,self.size do
      self.grid[i][j] = {}
      self.grid[i][j].food = false
      self.grid[i][j].player = false
    end
  end

  math.randomseed(os.time())

  -- set up initial player positions
  self.playerPositionX = math.random(0, self.size)
  self.playerPositionY = math.random(0, self.size)
  self.playerPositionXY = self.playerPositionX .. self.playerPositionY

  -- set up initial food position
  self.foodPositionX = math.random(0, self.size)
  self.foodPositionY = math.random(0, self.size)
  self.foodPositionXY = self.foodPositionX .. self.foodPositionY

  -- ensure the food position isn't the same as the player's position
  while self.foodPositionXY == self.playerPositionXY do
    self.foodPositionX = math.random(0, self.size)
    self.foodPositionY = math.random(0, self.size)
    self.foodPositionXY = self.foodPositionX .. self.foodPositionY
  end

  self.grid[self.playerPositionX][self.playerPositionY].player = true
  self.grid[self.foodPositionX][self.foodPositionY].food = true

  return self
end

function Level.getGridSize(self)
  return self.gridSize
end

function Level.getPlayerPosition(self)
  return self.playerPositionXY
end

function Level.getFoodPosition(self)
  return self.foodPositionXY
end

function Level.movePlayer(self, direction)
  if direction == "l" then
    if self.playerPositionX > 0 then
      newPlayerPositionX = self.playerPositionX - 1
      self.grid[self.playerPositionX][self.playerPositionY].player = false;
      self.playerPositionX = newPlayerPositionX
      self.grid[self.playerPositionX][self.playerPositionY].player = true;
      self.playerPositionXY = self.playerPositionX .. self.playerPositionY
    else
      return -1
    end
  elseif direction == "r" then
    if self.playerPositionX < self.size then
      newPlayerPositionX = self.playerPositionX + 1
      self.grid[self.playerPositionX][self.playerPositionY].player = false;
      self.playerPositionX = newPlayerPositionX
      self.grid[self.playerPositionX][self.playerPositionY].player = true;
      self.playerPositionXY = self.playerPositionX .. self.playerPositionY

    else
      return -1
    end
  elseif direction == "u" then
    if self.playerPositionY > 0 then
      newPlayerPositionY = self.playerPositionY - 1
      self.grid[self.playerPositionX][self.playerPositionY].player = false;
      self.playerPositionY = newPlayerPositionY
      self.grid[self.playerPositionX][self.playerPositionY].player = true;
      self.playerPositionXY = self.playerPositionX .. self.playerPositionY
    else
      return -1
    end
  elseif direction == "d" then
    if self.playerPositionY > self.size then
      newPlayerPositionY = self.playerPositionY - 1
      self.grid[self.playerPositionX][self.playerPositionY].player = false;
      self.playerPositionY = newPlayerPositionY
      self.grid[self.playerPositionX][self.playerPositionY].player = true;
      self.playerPositionXY = self.playerPositionX .. self.playerPositionY
    else
      return -1
    end
  end

  if self.playerPositionXY == self.foodPositionXY then
    -- ensure the food position isn't the same as the player's position
    while self.foodPositionXY == self.playerPositionXY do
      self.foodPositionX = math.random(0, self.size)
      self.foodPositionY = math.random(0, self.size)
      self.foodPositionXY = self.foodPositionX .. self.foodPositionY
    end

    return 2
  end
  
  return 1
end
