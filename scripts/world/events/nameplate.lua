local Nameplate, super = Class(Event)

function Nameplate:init(data)
    super:init(self, data.center_x, data.center_y, data.width, data.height)

    self:setOrigin(0.5, 0.5)

    self.asset = Assets.getTexture("nameplate")

    self.offsets = { -- x offset, y offset, progress
        {-10, 0, 0},
        {-10, 0, 0},
        {-10, 0, 0},
        {-10, 0, 0},
        {-10, 0, 0},
        {-10, 0, 0},
        {-10, 0, 0},
        {-10, 0, 0},
        {-10, 0, 0},
        {-10, 0, 0},
        {-10, 0, 0},
        {-10, 0, 0},
        {-10, 0, 0}
    }

    self.timer = 0
    self.current_letter = 1
end


function Nameplate:update()
    self.timer = self.timer + DTMULT

    for i = 1, 13 do
        self.offsets[i][2] = (math.sin(((self.timer + (i * 10)) / 20)) * 10) - 5
    end

    for i = 1, math.min(13, math.floor((self.timer + 4) / 4)) do
        self.offsets[i][1] = Ease.outCubic(self.offsets[i][3], -10, 10, 1)
        self.offsets[i][3] = math.min(1, self.offsets[i][3] + (0.05 * DTMULT))
    end
end

function Nameplate:draw()
    love.graphics.push()
    for i = 1, 13 do
        love.graphics.setColor(1, 1, 1, self.offsets[i][3])
        love.graphics.translate(self.offsets[i][1], self.offsets[i][2])
        Draw.pushScissor()
        Draw.scissor((i - 1) * 48, 0, 48, 120)
        love.graphics.draw(self.asset)
        Draw.popScissor()
        love.graphics.translate(-self.offsets[i][1], -self.offsets[i][2])
    end
    love.graphics.pop()

    super:draw(self)
end

return Nameplate
