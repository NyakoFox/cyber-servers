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

Cutscene.walkTo(kris,   240, 240, 4)
Cutscene.walkTo(ralsei, 160, 240, 4)
Cutscene.walkTo(susie,  320, 240, 4)
Cutscene.wait(3)

kris:setFacing("up")
ralsei:setFacing("up")
susie:setFacing("up")

Cutscene.wait(1)

sound_wing:play()
susie:shake(4, 0)
susie:setCustomSprite("susie_shock", 0, 0)

Cutscene.wait(1)

Cutscene.text("* We're, uh,", "face_14", "susie")
susie:setCustomSprite("susie_sheesh", 0, 0)
Cutscene.text("* Quite high up.", "face_16", "susie")

ralsei:setFacing("right")
Cutscene.text("* Aw, Susie, are you\nscared of heights?", "face_16", "ralsei")

susie:setFacing("left")
Cutscene.text("* Uhhhhh...", "face_14", "susie")
Cutscene.text("* O-of course not! I'm\njust...", "face_16", "susie")
susie:setFacing("right")
Cutscene.wait(1)
Cutscene.text("* Just worried about you\nguys falling!", "face_16", "susie")

ralsei:setFacing("right")
Cutscene.text("* Aww, you're worried\nabout us?\n* That's so sweet!", "face_1", "ralsei")

susie:setFacing("up")

Cutscene.wait(0.5)

sound_wing:play()
susie:shake(4, 0)
susie:setCustomSprite("susie_exasperated_left", 0, 0)
Cutscene.text("* LET'S JUST GO OKAY???", "face_17", "susie")

sound_jump:play()
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

kris:setCustomSprite("kris_pose", 2, 2)
kris:spin(0)
susie:setCustomSprite("susie_pose", -2, -2)
susie:spin(0)
ralsei:setCustomSprite("ralsei_pose", 10, 0)
ralsei:spin(0)
Cutscene.wait(15 / 30)
Cutscene.resetSprites()

Cutscene.attachFollowers(false)
