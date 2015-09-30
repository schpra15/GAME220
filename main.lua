

--require libraries
local physics = require( "physics" )
local native = require( "native" )
physics.start()

--displays the sky blue background
local background = display.newImage("bkgrnd.png")
background.x = 220

--creats a static object ground
local ground = display.newImage("grass.png")
ground.y = 280
physics.addBody(ground, "static", { density=1.0, friction=0.3, bounce=0.2 })

--creat a new body player

local player = display.newImage("pfrnd2.png")
player.y=180
player.x=450
physics.addBody(player, "dynamic", { density=1.0, friction=0, bounce=0.2 })
player.gravityScale = 1

local enemy = display.newImage("enemy.png")
enemy.y=150
physics.addBody(enemy, "static", { density=1.0, friction=0.3, bounce=0.2 })

c = 0
while c < 5 do
if enemy.x +100 == player.y  then
physics.removeBody(player)
break
end
player:applyForce(-30,0,player.x,player.y)
c = c +1
end
dens = 0


local dens = native.newTextBox(40,40,40,40)
dens.inputType = "number"
t=0
--while t <3 do
local b = display.newImage("bullets.png")
b.y=140
b.x=40
physics.addBody(b, "dynamic", { density=1, friction=0, bounce=.1 })
b.gravityScale = 1

b.gravityScale = 0

--Make the object a "bullet" type object
b.isBullet = true

b:setLinearVelocity( -800,0 )
t = t+1

--end

local function onLocalCollision( self, event )

    if ( event.phase == "began" ) then
        print("began")
    elseif ( event.phase == "ended" ) then
        print("ended")
end
end

b.collision = onLocalCollision
b:addEventListener( "collision", b )

player.collision = onLocalCollision
player:addEventListener( "collision", player)