function Mod:init()
    print("Entered the Cyber Servers!")
    Game.state = "NONE"

    Game.world.player.visible = false

    for _,v in ipairs(Game.world.followers) do
        v.visible = false
    end

    self.jump = Assets.newSound("snd_jump")
    self.chain_extend = Assets.newSound("snd_chain_extend")
    self.wing = Assets.newSound("snd_wing")
    self.locker = Assets.newSound("snd_locker")


    self.skip_amount = 0
    self.skip_timer = 0

    self.skipped = false

    Timer.script(function(wait)
        if self.skipped then return end
        self.jump:play()
        wait(0.8)
        if self.skipped then return end
        self.wing:play()

        wait(1)
        if self.skipped then return end
        self.chain_extend:setLooping(true)
        self.chain_extend:setPitch(1.1)
        self.chain_extend:setVolume(0.3)
        self.chain_extend:play()
        wait(3)
        if self.skipped then return end
        self.chain_extend:stop()
        self.locker:play()
        wait(1)
        if self.skipped then return end
        self.jump:play()
        wait(0.8)
        if self.skipped then return end
        self.wing:play()
        self.skipped = true

        self:enterOverworld()
    end)
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
    Game.state = "OVERWORLD"
    Game.world.state = "TRANSITION_IN"
    Game.world.transition_fade = 1
    Game.world:loadMap("clouds_entrance")
    Game.world:spawnParty()

    Cutscene.detachFollowers()

    Game.world.followers[1].y = Game.world.followers[1].y + 32 + 4
    Game.world.followers[2].y = Game.world.followers[2].y + 32

    Game.world.followers[1].x = Game.world.followers[1].x + 46 + 30
    Game.world.followers[2].x = Game.world.followers[2].x - 46 - 24

    Game.world.followers[1]:setFacing("left")
    Game.world.followers[2]:setFacing("right")

    Cutscene.attachFollowers(true)

end