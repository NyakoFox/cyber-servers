return function(cutscene)

    local sound_jump = Assets.newSound("snd_jump")
    local sound_wing = Assets.newSound("snd_wing")
    local sound_swing = Assets.newSound("snd_swing")
    local sound_impact = Assets.newSound("snd_impact")
    local sound_bell = Assets.newSound("snd_bell")
    
    local kris = cutscene:getCharacter("kris")
    local susie = cutscene:getCharacter("susie")
    local ralsei = cutscene:getCharacter("ralsei")
    
    cutscene:detachFollowers()
    
    susie.noclip = false
    ralsei.noclip = false

    cutscene:walkTo(ralsei, 160, 240, 4, "up")
    --cutscene:walkTo(kris,   kris.x, 280, 4, "up")
    --cutscene:walkTo(kris,   240, kris.y, 4, "up")
    --cutscene:walkTo(kris,   kris.x, 240, 4, "up")
    cutscene:walkTo(kris,   240, 240, 4, "up")
    cutscene:wait(cutscene:walkTo(susie,  susie.x, 280, 4, "up"))
    cutscene:wait(cutscene:walkTo(susie,  320, susie.y, 4, "up"))
    cutscene:wait(cutscene:walkTo(susie,  susie.x, 240, 4, "up"))

    cutscene:wait(1)
    
    sound_wing:play()
    susie:shake(4, 0)
    
    susie.sprite:set("shock_up")
    
    cutscene:wait(1)
    
    cutscene:text("* We're,[wait:5] uh,[wait:5]", "shock_down", "susie")
    
    susie.sprite:set("shock_down")
    cutscene:text("* Quite high up.", "shock_nervous", "susie")
    
    ralsei:resetSprite()
    ralsei:setFacing("right")
    cutscene:text("* Aw,[wait:5] Susie,[wait:5] are you\nscared of heights?", "wink", "ralsei")
    
    susie:resetSprite()
    susie:setFacing("left")
    cutscene:text("* Uhhhhh...", "shock_down", "susie")
    cutscene:text("* O-of course not![wait:5] I'm\njust...", "shock_nervous", "susie")
    susie:setFacing("right")
    cutscene:wait(1)
    cutscene:text("* Just worried about one\nof you falling!", "shock_nervous", "susie")
    
    ralsei:setFacing("right")
    cutscene:text("* Aww,[wait:5] you're worried\nabout us?[wait:5]\n* That's so sweet!", "blush", "ralsei")
    
    susie:setFacing("up")
    
    cutscene:wait(0.8)
    
    sound_wing:play()
    susie:shake(4, 0)
    susie.sprite:set("exasperated_left")
    cutscene:text("* LET'S JUST GO OKAY???", "teeth_b", "susie")
    
    sound_jump:play()
    
    cutscene:resetSprites()
    kris:setFacing("right")
    susie:setFacing("right")
    ralsei:setFacing("right")
    
    kris  :jumpTo(320 + 80, 280, 12, 17, "fall_1", "landed_1")
    ralsei:jumpTo(160 + 80, 280, 12, 17, "fall", "landed_1")
    susie :jumpTo(240 + 80, 280, 12, 17, "fall_1", "landed_1")
    
    --c_sel(kr)
    --c_jump_sprite(720, 193, 12, 17, spr_kris_fall_d_dw, spr_kris_dw_landed)
    --c_delayfacing(16, "r")
    --c_sel(su)
    --c_delayfacing(16, "r")
    --c_jump_sprite(635, 178, 12, 17, spr_susie_dw_fall_d, spr_susie_dw_landed)
    --c_sel(ra)
    --c_delayfacing(16, "r")
    --c_jump_sprite(564, 184, 12, 17, spr_ralsei_jump, spr_teacup_ralsei_land)
    cutscene:wait(20 / 30)
    sound_impact:play()
    cutscene:wait(16 / 30)
    sound_swing:play()
    kris:spin(2)
    susie:spin(2)
    ralsei:spin(2)
    cutscene:wait(16 / 30)
    sound_bell:play()
    
    kris:spin(0)
    susie:spin(0)
    ralsei:spin(0)
    kris.sprite:set("pose")
    susie.sprite:set("pose")
    ralsei.sprite:set("pose")
    cutscene:wait(15 / 30)
    cutscene:resetSprites()
    
    kris:setFacing("right")
    susie:setFacing("right")
    ralsei:setFacing("right")
    cutscene:keepFollowerPositions()
    cutscene:attachFollowers(0) -- 0 so they don't move
end