Cosmos = {}

function Cosmos:new()
  local o = {}
  setmetatable(o, Cosmos)
  self.__index = self
  o.updateSystems = {}
  o.renderSystems = {}
  return o
end

function Cosmos:newEntity()
  return Entity:new()
end

function Cosmos:addUpdateSystem(updateSystem)
  self.updateSystems[updateSystem] = true
end

function Cosmos:removeUpdateSystem(updateSystem)
  self.updateSystems[updateSystem] = nil
end

function Cosmos:update(dt)
  for updateSystem in pairs(self.updateSystems) do
    updateSystem(dt)
  end
end

function Cosmos:addRenderSystem(renderSystem)
  self.renderSystems[renderSystem] = true
end

function Cosmos:removeRenderSystem(renderSystem)
  self.renderSystems[renderSystem] = nil
end

function Cosmos:render()
  for renderSystem in pairs(self.renderSystems) do
    renderSystem()
  end
end

Entity = {}

function Entity:new()
  local o = {}
  setmetatable(o, Entity)
  self.__index = self
  o.components = {}
  return o
end

function Entity:addComponent(name, data)
  data = data or {}
  self.components[name] = data
end

return Cosmos
