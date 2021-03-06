local workspace = {}

workspace.genWorld = function()
  return {
    addItem = function(self, t)
      if t == "Box" then
        local newItem = {
          ["Type"] = "Box";
          ["Size"] = Vector.new(100, 100);
          ["Position"] = Vector.new(0, 0);
          ["IsHollow"] = false;
          ["World"] = self;
          ["Color"] = Color3.new(0, 0, 0);

          Destroy = function(self)
            self.World.Items[self] = nil
          end
        }
        self.Items[newItem] = newItem
        return newItem
      end
    end,

    Render = function(self)
      for _, v in pairs(self.Items) do
        if v.Type == "Box" then
          love.graphics.rectangle(v.IsHollow and "line" or "fill", v.Position.X - v.Size.X/2 - self.Camera.Position.X, v.Position.Y - v.Size.Y/2 - self.Camera.Position.Y, v.Size.X, v.Size.Y)
        end
      end
    end,

    Items = {};

    Camera = {
      ["Position"] = Vector.new(0, 0)
    }
  }
end

return workspace
