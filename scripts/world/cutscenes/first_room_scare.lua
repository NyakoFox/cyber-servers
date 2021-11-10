local sound_jump = Assets.newSound("snd_jump")
local sound_wing = Assets.newSound("snd_wing")
local sound_swing = Assets.newSound("snd_swing")
local sound_impact = Assets.newSound("snd_impact")
local sound_bell = Assets.newSound("snd_bell")

local kris = Cutscene.getCharacter("kris")
local susie = Cutscene.getCharacter("susie")
local ralsei = Cutscene.getCharacter("ralsei")

Cutscene.detachFollowers()

susie.noclip = false
ralsei.noclip = false

Cutscene.walkTo(kris,   240, 240, 4, "up")
Cutscene.walkTo(ralsei, 160, 240, 4, "up")
Cutscene.walkTo(susie,  320, 240, 4, "up")
Cutscene.wait(3)

sound_wing:play()
susie:shake(4, 0)

susie.sprite:set("shock")

Cutscene.wait(1)

Cutscene.text("* We're, uh,", "face_14", "susie")

susie.sprite:set("sheesh")
Cutscene.text("* Quite high up.", "face_16", "susie")

ralsei:setFacing("right")
Cutscene.text("* Aw, [wait:4]Susie, [wait:4]are you\nscared of heights?", "face_16", "ralsei")

susie:setFacing("left")
Cutscene.text("* Uhhhhh...", "face_14", "susie")
Cutscene.text("* O-of course not! [wait:4]I'm\njust...", "face_16", "susie")
susie:setFacing("right")
Cutscene.wait(1)
Cutscene.text("* Just worried about one\nof you falling!", "face_16", "susie")

ralsei:setFacing("right")
Cutscene.text("* Aww, you're worried\nabout us?[wait:4]\n* That's so sweet!", "face_1", "ralsei")

susie:setFacing("up")

Cutscene.wait(0.8)

sound_wing:play()
susie:shake(4, 0)
susie.sprite:set("exasperated_left")
Cutscene.text("* LET'S JUST GO OKAY???", "face_17", "susie")

sound_jump:play()

kris:setFacing("right")
susie:setFacing("right")
ralsei:setFacing("right")

kris  :jumpTo(320 + 80, 280, 12, 17, "jump", "landed")
ralsei:jumpTo(160 + 80, 280, 12, 17, "jump", "landed")
susie :jumpTo(240 + 80, 280, 12, 17, "jump", "landed")

--c_sel(kr)
--c_jump_sprite(720, 193, 12, 17, spr_kris_fall_d_dw, spr_kris_dw_landed)
--c_delayfacing(16, "r")
--c_sel(su)
--c_delayfacing(16, "r")
--c_jump_sprite(635, 178, 12, 17, spr_susie_dw_fall_d, spr_susie_dw_landed)
--c_sel(ra)
--c_delayfacing(16, "r")
--c_jump_sprite(564, 184, 12, 17, spr_ralsei_jump, spr_teacup_ralsei_land)
Cutscene.wait(20 / 30)
sound_impact:play()
Cutscene.wait(16 / 30)
sound_swing:play()
kris:spin(2)
susie:spin(2)
ralsei:spin(2)
Cutscene.wait(16 / 30)
sound_bell:play()

kris:spin(0)
susie:spin(0)
ralsei:spin(0)
kris.sprite:set("pose")
susie.sprite:set("pose")
ralsei.sprite:set("pose")
Cutscene.wait(15 / 30)
Cutscene.resetSprites()

kris:setFacing("right")
susie:setFacing("right")
ralsei:setFacing("right")
Cutscene.keepFollowerPositions()
Cutscene.attachFollowers(0) -- 0 so they don't move

