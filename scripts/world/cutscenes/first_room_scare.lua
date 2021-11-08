local sound_jump = Assets.newSound("snd_jump")
local sound_wing = Assets.newSound("snd_wing")


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

Cutscene.wait(0.5)

sound_wing:play()
susie:setCustomSprite("susie_shock", 0, 0)

Cutscene.wait(0.5)

Cutscene.text("* We're, uh,", "susie/spr_face_susie_alt_14", {x=-5, y=0})
susie:setCustomSprite("susie_sheesh", 0, 0)
Cutscene.text("* Quite high up.", "susie/spr_face_susie_alt_16", {x=-5, y=0})

ralsei:setFacing("right")
Cutscene.text("* Aw, Susie, are you\nscared of heights?", "ralsei/spr_face_r_nohat_16", {x=-15, y=-10})

susie:setFacing("left")
Cutscene.text("* Uhhhhh...", "susie/spr_face_susie_alt_14", {x=-5, y=0})
Cutscene.text("* O-of course not! I'm\njust...", "susie/spr_face_susie_alt_16", {x=-5, y=0})
Cutscene.text("* Just worried about you\nguys falling!", "susie/spr_face_susie_alt_16", {x=-5, y=0})

ralsei:setFacing("right")
Cutscene.text("* Aww, you're worried\nabout us?\n* That's so sweet!", "ralsei/spr_face_r_nohat_1", {x=-15, y=-10})

susie:setFacing("up")

Cutscene.wait(0.5)

sound_wing:play()
susie:setCustomSprite("susie_exasperated", 0, 0)
Cutscene.text("* LET'S JUST GO OKAY???", "susie/spr_face_susie_alt_17", {x=-5, y=0})

susie:setFacing("down")

Cutscene.attachFollowers(false)
