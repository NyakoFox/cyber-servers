return function(cutscene)
    Game.world.followers[1].y = Game.world.followers[1].y + 32 + 4
    Game.world.followers[2].y = Game.world.followers[2].y + 32

    Game.world.followers[1].x = Game.world.followers[1].x + 46 + 30
    Game.world.followers[2].x = Game.world.followers[2].x - 46 - 24

    Game.world.followers[1]:setFacing("left")
    Game.world.followers[2]:setFacing("right")

    cutscene:keepFollowerPositions()
    --cutscene:attachFollowers()
    print("mario")

    Mod.jump:play()
    cutscene:wait(0.8)
    Mod.wing:play()

    cutscene:wait(1)
    Mod.chain_extend:setLooping(true)
    Mod.chain_extend:setPitch(1.1)
    Mod.chain_extend:setVolume(0.3)
    Mod.chain_extend:play()
    cutscene:wait(3)
    Mod.chain_extend:stop()
    Mod.locker:play()
    cutscene:wait(1)
    Mod.jump:play()
    cutscene:wait(0.8)
    Mod.wing:play()
    Mod.skipped = true

    Mod:enterOverworld()
end