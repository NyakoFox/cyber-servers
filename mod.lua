function Mod:init()
    print("Entered the Cyber Servers!")

    self.skip_amount = 0
    self.skip_timer = 0

    self.jump = Assets.newSound("snd_jump")
    self.chain_extend = Assets.newSound("snd_chain_extend")
    self.wing = Assets.newSound("snd_wing")
    self.locker = Assets.newSound("snd_locker")

    self.skipped = false
end

function Mod:postInit(new_file)
    if (new_file) then
        Game.world:startCutscene("mod_enter")
        self.rectangle = Rectangle(0, 0, 640, 480)
        self.rectangle:setColor(0, 0, 0, 1)
        self.rectangle:setParallax(0, 0)
        self.rectangle.layer = 9999
        Game.world:addChild(self.rectangle)
    end
end

function Mod:preUpdate(dt)
    if self.skipped then return end

    self.skip_timer = math.max(0, self.skip_timer - dt)

    if self.skip_timer == 0 then
        self.skip_amount = 0
        self.skip_timer = 0
    end

    if Input.pressed("confirm") or Input.pressed("cancel") then
        self.skip_amount = self.skip_amount + 1
        self.skip_timer = 0.5
    end

    if self.skip_amount >= 4 then
        self.skipped = true
        self.jump:stop()
        self.chain_extend:stop()
        self.wing:stop()
        self.locker:stop()

        self:enterOverworld()
    end
end

function Mod:enterOverworld()
    Game.world.state = "TRANSITION_IN"
    Game.world.transition_fade = 1
    self.rectangle:remove()
    Game.world:stopCutscene()
end
