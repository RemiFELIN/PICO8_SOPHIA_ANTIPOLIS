pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--coconut frenzy
--v bettenfeld 2017


-- fonction pour reconnaitre quand une touche est enfoncé, released ...
keys={btns={},ct={}}

function keys:update()
  for i=0,13 do
  if band(btn(),shl(1,i))==shl(1,i) then
  if keys:held(i) then
  keys.btns[i]=2
  keys.ct[i]=(keys.ct[i]+1) % 30
  else
  keys.btns[i]=3
  end
  else
  if keys:held(i) then 
  keys.btns[i]=4
  else
  keys.btns[i]=0
  keys.ct[i]=0
  end
  end
  end
end

function keys:held(b) return band(keys.btns[b],2) == 2 end
function keys:down(b) return band(keys.btns[b],1) == 1 end
function keys:up(b) return band(keys.btns[b],4) == 4 end
function keys:pulse(b,r) return (keys:held(b) and keys.ct[b]%r==0) end

--snipet pour les dialogues
-- call this before you start using dtb.
-- optional parameter is the number of lines that are displayed. default is 3.
function dtb_init(numlines)
dtb_queu={}
dtb_queuf={}
dtb_numlines=3
if numlines then
dtb_numlines=numlines
end
_dtb_clean()
end

-- this will add a piece of text to the queu. the queu is processed automatically.
function dtb_disp(txt,callback)
  local lines={}
  local currline=""
  local curword=""
  local curchar=""
  local upt=function()
    if #curword+#currline>29 then
      add(lines,currline)
      currline=""
    end
    currline=currline..curword
    curword=""
  end
  for i=1,#txt do
    curchar=sub(txt,i,i)
    curword=curword..curchar
    if curchar==" " then
      upt()
    elseif #curword>28 then
      curword=curword.."-"
      upt()
    end
  end
upt()
if currline~="" then
  add(lines,currline)
end
add(dtb_queu,lines)
if callback==nil then
  callback=0
end
  add(dtb_queuf,callback)
end

-- functions with an underscore prefix are ment for internal use, don't worry about them.
function _dtb_clean()
dtb_dislines={}
for i=1,dtb_numlines do
add(dtb_dislines,"")
end
dtb_curline=0
dtb_ltime=0
end

function _dtb_nextline()
  dtb_curline+=1
  for i=1,#dtb_dislines-1 do
    dtb_dislines[i]=dtb_dislines[i+1]
  end
  dtb_dislines[#dtb_dislines]=""
  --ajout sfx 'bip bip'
  --sfx(8)
end

function _dtb_nexttext()
  if dtb_queuf[1]~=0 then -- ~= ===> not egal
   dtb_queuf[1]()
  end
  del(dtb_queuf,dtb_queuf[1])
  del(dtb_queu,dtb_queu[1])
  _dtb_clean()
  --ajout sfx 'bip bip'
  --sfx(8)
end

-- make sure that this function is called each update.
function dtb_update()
  if #dtb_queu>0 then
  if dtb_curline==0 then
  dtb_curline=1
  end
  local dislineslength=#dtb_dislines
  local curlines=dtb_queu[1]
  local curlinelength=#dtb_dislines[dislineslength]
  local complete=curlinelength>=#curlines[dtb_curline]
  if complete and dtb_curline>=#curlines then
  if keys:down(5) then
  _dtb_nexttext()
  return
  end
  elseif dtb_curline>0 then
  dtb_ltime-=1
  if not complete then
  if dtb_ltime<=0 then
    local curchari=curlinelength+1
    local curchar=sub(curlines[dtb_curline],curchari,curchari)
    dtb_ltime=1
    if curchar~=" " then
      sfx(8)
    end
    if curchar=="." then
      dtb_ltime=6
    end
    dtb_dislines[dislineslength]=dtb_dislines[dislineslength]..curchar
  end
  if keys:down(5) then
    dtb_dislines[dislineslength]=curlines[dtb_curline]
  end
  else
  if(keys:down(5)) then
    _dtb_nextline()
  end
  end
  end
  end
end

-- make sure to call this function everytime you draw.
function dtb_draw()
if #dtb_queu>0 then
local dislineslength=#dtb_dislines
local offset=0
if dtb_curline<dislineslength then
offset=dislineslength-dtb_curline
end
rectfill(cam_x+3,cam_y+125-dislineslength*8,cam_x+125,cam_y+125,0)
if dtb_curline>0 and #dtb_dislines[#dtb_dislines]==#dtb_queu[1][dtb_curline] then
print("\151",cam_x+118,cam_y+120,1)
end
for i=1,dislineslength do
print(dtb_dislines[i],4+cam_x,cam_y+i*8+119-(dislineslength+offset)*8,7)
end
end
end

--fin du snippet

function _init()
  particles={}
  checkpoint={}
  sparks={}
  projectils = {}
  guitare={
    sp = 42,
    x = 120,
    y = 480,
    w = 8,
    h = 8,
    anim = 0
  }
  menez={  
    sp=32,
    x=264, --position initiale
    y=480,
    w=8,
    h=8,
    flp=true -- vers la gauche
  }
  for i=1,200 do
    add(sparks,{
      x=0,y=0,velx=0,vely=0,
      r=0,alive=false
    })
  end
  create_checkpoint(240,488)
  create_checkpoint(432,480)
  --simple camera
  cam_x=0
  cam_y=0
  -- variable globale
  game_state="menu"
  gravity=0.3
  friction=0.85
  interaction = false
  start_bulle = false
  checkpointx = 9 --pour memoriser le dernier checkpoint
  checkpointy = 430
  checkpoint_number = 0 --pour l'animation du checkpoint
  spnum = 0
  guit_found = false --si buffa a trouver la guitare
  tmp = 0
  reattak = true --pour creer un delai entre les attaques
  --map limits
  map_start=0
  mapx_end=1024
  mapy_end = 512
  intro_init()
  dtb_init()
  player_reset()
end

-->8
--update and draw

function _update()

  if game_state == "plot" then
    if (keys:down(5))  then
      plot()
      game_state = "game"
    end
  end
  if game_state == "menu" then
  skydeg += 0.0005
    if keys:down(5) then
      game_state = "plot"
    end
  end
  if game_state == "game" and player.alive then
    player_update()
    if guit_found then
      player_guit_animate()
    else
      player_animate()
    end
    droid_update()
    droid_animate()
    dtb_update()
    projectils_update()
    if not guit_found then
      guitare_animate()
    end
    if checkpoint_number> 0 then
      checkpoint_animate(checkpoint_number)
    end
    --simple camera
    cam_x=player.x-64+(4)
    if cam_x<map_start then
      cam_x=map_start
    end
    if cam_x>mapx_end-128 then
      cam_x=mapx_end-128
    end
    cam_y=player.y-64+(player.h/2)
    if cam_y<map_start then
      cam_y=map_start
    end
    if cam_y>mapy_end-128 then
      cam_y=mapy_end-128
    end
  end

  if not player.alive then
    if del_acc == 0 then
      player_reset()
    else
      del_acc -= 1
    end
  end
  explosion_update()
  foreach(particles,update_part)
  keys:update()
  camera(cam_x,cam_y)
end




function _draw()
  cls()
  --menu
  if game_state == "menu" then
    intro()
  end

  if game_state == "plot" then
    plot()
  end
  if game_state == "game"  then
    cls()
    map(0,0,0,0,128,64)
    --dessines les arbres
    spr(56,0,456,2,5,true) -- arbre 1/2
    spr(56,16,456,2,5,false) -- arbre 2/2
    spr(56,46,456,2,5,true) -- arbre 1/2
    spr(56,62,456,2,5,false) -- arbre 2/2
    spr(56,92,456,2,5,true) -- arbre 1/2
    spr(56,108,456,2,5,false) -- arbre 2/2
    --dessine les checkpoints
    spr(checkpoint[1].sp,checkpoint[1].x,checkpoint[1].y,1,1,checkpoint[1].flp)
    spr(checkpoint[2].sp,checkpoint[2].x,checkpoint[2].y,1,1,checkpoint[2].flp)
    --dessine les npc
    spr(menez.sp,menez.x,menez.y,1,2,menez.flp)
    for droid in all(droids) do
      spr(droid.sp,droid.x,droid.y,droid.w/8,droid.h/8,droid.flp)
    end
    if player.alive then
      spr(player.sp,player.x,player.y,player.w/8,2,player.flp)
      for projectil in all(projectils) do
        spr(projectil.sp,projectil.x,projectil.y,1,1,projectil.flp)
      end
    end
    if not guit_found then
      spr(guitare.sp,guitare.x,guitare.y)
    end
    dialog_menez()
    draw_explosion()
    foreach(particles,draw_part)
  end
end

-->8
--collisions
function collide_map(obj,aim,flag)
  --obj = table needs x,y,w,h
  --aim = left,right,up,down

  local x=obj.x  local y=obj.y
  local w=obj.w  local h=obj.h

  local x1=0	 local y1=0
  local x2=0  local y2=0

  if aim=="left" then
    x1=x-1  y1=y
    x2=x    y2=y+h-1

  elseif aim=="right" then
    x1=x+w-1    y1=y
    x2=x+w  y2=y+h-1

  elseif aim=="up" then
    x1=x+2    y1=y-1
    x2=x+w-3  y2=y

  elseif aim=="down" then
    x1=x+2      y1=y+h
    x2=x+w-3    y2=y+h
  end

  --pixels to tiles
  x1/=8    y1/=8
  x2/=8    y2/=8

  if fget(mget(x1,y1), flag)
  or fget(mget(x1,y2), flag)
  or fget(mget(x2,y1), flag)
  or fget(mget(x2,y2), flag) then
  return true
  else
  return false
end

end

function broken_titles() 
  local x1=player.x+2  local y1=player.y+player.h
  local x2=player.x+player.w-3  local y2=player.y+player.h
  --pixels to tiles
  x1/=8    y1/=8
  x2/=8    y2/=8
  if (mget(x1,y1) == 97 ) then
    explode_titles(x1,y1)
  elseif (mget(x1,y2) == 97 ) then
    explode_titles(x1,y2)
  elseif (mget(x2,y1) == 97 ) then
    explode_titles(x2,y1)
  elseif (mget(x2,y2) == 97 ) then
    explode_titles(x2,y2)
  end
end

function explode_titles(x,y)
  if del_title== 0 then
    mset(x,y,68)
    explosion(x*8,y*8,2,100,5)
    del_title=12 
  else
    del_title -= 1
  end
end
-- -->8
-- --player

function player_update()
  --physics
  player.dy+=gravity
  player.dx*=friction

  --controls
  if game_state == "game" and #dtb_queu==0 and not player.down then
    if btn(0) then
      player.dx-=player.acc
      player.running=true
      player.flp=true
    end
    if btn(1) then
      player.dx+=player.acc
      player.running=true
      player.flp=false
    end
  end

  -- stop running 
  if player.running
  and not btn(0)
  and not btn(1)
  and not player.falling
  and not player.jumping then
    player.running=false
  end

  if game_state == "game" 
  and #dtb_queu==0 
  and player.landed then
    --fire
    if keys:down(4) and not player.down and not player.running and guit_found and reattak then
      fire_projectil(player)
      player.attak = true
    else
      player.attak = false
    end
    --se baisser
    if keys:held(3) and game_state == "game" and #dtb_queu==0 and not player.falling and not player.jumping then
      player.down = true
    else
      player.down = false
    end
    --jump
    if keys:down(2) then
      player.dy-=player.boost
      player.landed=false
      --player.doublejump=true
   end
  end
  --double jump
  if keys:down(2) and game_state == "game" 
  and #dtb_queu==0 and (player.jumping or player.falling) and player.doublejump then
    player.dy=0
    for i=1,6 do
      cr_part(player.x+player.w/2+player.dx,player.y+player.h,7,1)
      cr_part(player.x+player.w/2+player.dx,player.y+player.h,7,-1)
     end
    player.dy-=player.boost*0.7
    player.doublejump=false
 end
  --check collision up and down
  if player.dy>0 then
    player.falling=true
    player.landed=false
    player.jumping=false
    --player.dy=limit_speed(player.dy,player.max_dy)
    if collide_map(player,"down",0) or collide_map(player,"down",2) then
      player.doublejump = true
      player.landed=true
      player.falling=false
      player.dy=0
      player.y-=((player.y+player.h+1)%8)-1
      if collide_map(player,"down",2) then
        broken_titles()
      end
    end
  elseif player.dy<0 then
    player.jumping=true
    del_title=12 
    if collide_map(player,"up",1) then
      player.dy=0
    end
  end
  if collide_obj(player,guitare) and not guit_found then
    guit_found = true
    plsp = 34
  end
  --check collision left and right
  if player.dx<0 then
   player.dx=limit_speed(player.dx,player.max_dx)
    if collide_map(player,"left",1) then
      player.dx=0
    end
  elseif player.dx>0 then
    player.dx=limit_speed(player.dx,player.max_dx)
    if collide_map(player,"right",1) then
      player.dx=0
    end
  end

  if collide_obj(player,menez,8) and not start_bulle and #dtb_queu==0 then
    interaction = true
  else
   interaction = false
  end
  for droid in all(droids) do
    if collide_obj(player,droid,-1) then
      player_dead()
    end
  end

  for i=1,#checkpoint do
    if collide_obj(player,checkpoint[i])  then
      checkpoint_number = i
      checkpointx = checkpoint[i].x
      checkpointy = checkpoint[i].y
    end
  end

  if keys:down(5) and interaction then
    interaction = false
    start_bulle = true
  end
  if #dtb_queu == 0 then
    player.x+=player.dx
    player.y+=player.dy
  else
    player.dx = 0
    player.dy = 0
  end

  --limit player to map
  if player.x<map_start then
    player.x=map_start
  end
  if player.x>mapx_end-player.w then
    player.x=mapx_end-player.w
  end
  if player.y> mapy_end-player.h/2 then
    player_dead()
  end
  if player.running or player.jumping or player.falling then waited = false end
end

function droid_update()

  for droid in all(droids) do
    droid.dx=limit_speed(droid.dx,droid.max_dx)
    if droid.w == 16 then
      droid.dx*=friction
      --movement
      if game_state == "game" then
        if droid.flp then
          droid.dx-=droid.acc
        else
          droid.dx+=droid.acc
        end
      end
      if droid.x < droid.zonex1  then
        droid.flp = false
      end
      if droid.x > droid.zonex2 then
        droid.flp = true
      end
      droid.x+=droid.dx
    else
      droid.dx*=friction
      --movement
      if game_state == "game" then
        if droid.flp then
          droid.dx-=droid.acc
        else
          droid.dx+=droid.acc
        end
      end
      if droid.x < droid.zonex1  then
        droid.flp = false
      end
      if droid.x > droid.zonex2 then
        droid.flp = true
      end
    
      if droid.y < droid.zoney1 then
        droid.dy +=0.1
      end
    
      if droid.y > droid.zoney2 then
        droid.dy -=0.1
      end
      droid.y+=droid.dy
      droid.x+=droid.dx
    end
  end
end


function guitare_animate() 
  if time()-guitare.anim>.3 then
    guitare.anim=time()
    guitare.sp+=1
    if guitare.sp > 41 then
      guitare.sp = 40
    end 
  end
end

function player_animate()
  if player.jumping then
    player.sp=6
    player.anim=time()
  elseif player.falling  then
    player.sp=7
    player.anim=time()
  elseif player.running then
    if time()-player.anim>.1 then
      player.anim=time()
      player.sp+=1
      if player.sp>4 then
        player.sp=2
      end
    end
  elseif player.down then
    player.sp = 8
    player.anim=time()
  else --player idle
    if time() - player.anim>3 or waited then
      waited = true
      if time()-player.anim>.3 then
        player.anim=time()
        player.sp+=1
        if player.sp>1 then
          player.sp=0
        end
      end
    else
      player.sp = 2
    end
  end
end

function player_guit_animate()

  if player.attak then
    player.anim=time()
    waited = false
    tmp=time()
    player.sp =14
    player.w = 16
    reattak = false
  end
  if time()-tmp>.2 or btn(0) or btn(1) or btn(2) or btn(3) then  
    player.w = 8
    reattak = true
    if player.jumping then
      player.sp=6
    elseif player.falling then
      player.sp=7
    elseif player.down then
      player.sp=8
    elseif player.running then
      if time()-player.anim>.1 then
        player.anim=time()
        player.sp+=1
        if player.sp>13 then
          player.sp=11
        end
      end
    else --player idle
      if time() - player.anim>3 or waited then
        waited = true
        if time()-player.anim>.3 then
          player.anim=time()
          player.sp+=1
          if player.sp>10 then
            player.sp=9
          end
        end
      else
          player.sp =11
      end
    end
  end
end

function droid_animate()
  for droid in all(droids) do
    if droid.w == 16 then
      if time()-droid.anim>.2 then
        droid.anim=time()
        droid.sp+=2
        if droid.sp>35 then
          droid.sp=33
        end
      end
    else
      if time()-droid.anim>.2 then
        droid.anim=time()
        droid.sp+=1
        if droid.sp>43 then
          droid.sp=42
        end
      end
    end
  end
end


function checkpoint_animate(x)

  if time()-checkpoint[x].anim>.5 then
    if spnum == 0 then
      checkpoint[x].sp = 112
    elseif spnum == 1 then
      checkpoint[x].sp = 113
    elseif spnum == 2 then
      checkpoint[x].sp = 114
    elseif spnum == 3 then
      checkpoint[x].sp = 115
    elseif spnum == 4 then
      checkpoint[x].sp = 114
      checkpoint[x].flp = true
    else 
      checkpoint[x].sp = 113
      checkpoint[x].flp = false
      spnum = 0
    end
    spnum+=1
  end

end

function projectils_update()

  for projectil in all(projectils) do
    if projectil.flp then
      projectil.x -= 4
    else
      projectil.x += 4
    end
    for droid in all(droids) do
      --check collision des projectils
      if projectil.x<map_start 
      or projectil.x>mapx_end 
      or collide_map(projectil,"right",1)
      or collide_map(projectil,"left",1)
      or collide_obj(projectil,droid) then
        del(projectils,projectil)
        if collide_obj(projectil,droid) then
          explosion(droid.x,droid.y,droid.w/4+1,100)
          del(droids,droid)
          sfx(1)
        else
          explosion(projectil.x,projectil.y,2,100)
        end
      end
    end
  end
end


function limit_speed(num,maximum)
return mid(-maximum,num,maximum)
end

--dessine la magnifique intro
function intro()
  titre="press ❎ to start!"
  chrono=(chrono+0.5)%10
  rectfill(0,0,127,127,1)
  for k,v in pairs(stars) do
    for i=0,0.01,0.001 do
      pset(
        v[1]*cos(skydeg+i)-
        v[2]*sin(skydeg+i)+
        63.5,
        v[2]*cos(skydeg+i)+
        v[1]*sin(skydeg+i)+
        63.5,
        7
      )
    end
  end
  sspr(80, 32, 48, 32,27,37,80,48) -- draw the 48 x 64 image from (80, 32) at screen location (27, 37) but stretched to 80 x 48
  print("a game made by miagestic",20,102,9)
  if (chrono<5) then
    print(titre,28,121,8)
    print(titre,29,120,9)
  else
    print(titre,28,120,8)
    print(titre,29,119,10)
  end
end


function round(var)
  if var-flr(var)>=0.5 then
    return ceil(var)
  else
    return flr(var)
  end 
end

--dessine la croix interactive
function drawx(dx,dy)
  print("❎",dx,dy,6)
  rectfill(dx+1,dy,dx+4,dy+3,0)
  print("❎",dx,dy-round(time()%1.05),7)
end


--pour faire les traits qui tourne
function intro_init()
  spsize = 64*sqrt(2)*2
  stars = {}
    for i=1,64 do
      add(stars, {
      rnd(spsize)-spsize/2,
      rnd(spsize)-spsize/2
      })
    end
  skydeg = 0
end

--affichage du plot
function plot()
  rectfill(0,0,127,127,1)
  print(" et si la miage devenait\n ...\n\n votre pire cauchemar !!! ",8,16,7)
end

--equivalent de la fonction sleep
function wait(a) 
  for i = 1,a do 
    flip() 
  end 
end

function dialog_menez()
  dtb_draw()
  if (interaction) then
    drawx(menez.x ,menez.y - 8)
  end
  if start_bulle then
    dtb_disp("buffa:hello menez.")
    dtb_disp("menez:salut mich,il y a des checkpoints maintenant, passe a cote d'une pancarte et sucuide toi tu vas voir.")
    dtb_disp("buffa:peut etre une autre fois.")
    start_bulle = false
  end
end


function explosion(x,y,r,parti,c)
  local selected = 0
  for i=1,#sparks do
    if not sparks[i].alive then
      sparks[i].x = x
      sparks[i].y = y
      sparks[i].velx = -1 + rnd(2)
      sparks[i].vely = -1 + rnd(2)
      sparks[i].mass = 0.5 + rnd(2)
      sparks[i].r = 0.5 + rnd(r)
      sparks[i].alive = true
      selected +=1
      if c then
        sparks[i].c = c
      else
        sparks[i].c = 5 + rnd(5)
      end
      if selected == parti then
      break end
    end
  end
end

function explosion_update()
  for i=1,#sparks do
    if sparks[i].alive then
      sparks[i].x += sparks[i].velx / sparks[i].mass
      sparks[i].y += sparks[i].vely / sparks[i].mass
      sparks[i].r -= 0.1
      if sparks[i].r < 0.1 then
        sparks[i].alive = false
      end
    end
  end
end

function draw_explosion()
  for i=1,#sparks do
    if sparks[i].alive then
      circfill(
        sparks[i].x,
        sparks[i].y,
        sparks[i].r,
        sparks[i].c
      )
    end
  end
end

function player_dead()
  player.alive = false
  if not hit then
    music(4)
    del_acc = 65 -- change pour delai avant restart
  end
  explosion(player.x+player.w/2,player.y+player.h/2,3,150,8)
  hit = true
end

function player_reset()
  reload(0, 0, 0x4300)--reload every block
  player={
    sp=plsp,--sprite du personnage
    x=checkpointx,--position x initiale
    y=checkpointy-32,--position y initiale
    w=8,--width la largeur en pixel du perso
    h=16,--height la hauteur en pixel du perso
    flp=false,--flip, faux si vers la droite et vrai si vers la gauche
    dx=0,--delta x, pour la vitesse de deplacement
    dy=0,--delta y, pour la vitesse de saut/chute
    max_dx=2,--vitesse max
    max_dy=3,--vitesse max
    acc=0.5,--acceleration, marche de pair avec delta x
    boost=4,--  marche de pair avec delta y 
    anim=0,--animation , pour regler le temps entre chaque frame
    proj=96, --le sprite du projectile
    fire = false, --si le joueur a deja tiré
    running=false,
    jumping=false,
    doublejump=false,
    falling=false,
    landed=false,
    alive = true,
    down = false,
    attak = false
    }
    droids = {} --pour pas qu'il se cummul on les supprime et recreer a chaque mort
    --droid terrestre sprite 33
    create_droid(33,110,480,0,120) --dessine le sprite 33 à (110,480) se deplacant de (0,480) à (120,480)
    create_droid(33,496,440,480,512)
    --droid volant sprite 42
    create_droid(42,180,440,140,220,425,455) --dessine le sprite 42 à (180,440) se deplacant de (140,425) à (220,455)
    create_droid(42,380,460,260,440,440,480)
    chrono=0 --sert pour animé le press x to play
    hit = false --si buffa a pris un coup
    del_acc = 1000 -- pour creer un delay
    del_title=12
    music(6) -- on reset la musique 

end

function fire_projectil(emeteur)

  add(projectils,{
    sp = emeteur.proj,
    x = emeteur.x,
    y = emeteur.y,
    w = 8, -- besoin de sa largeur et hauteur pour collide map
    h = 8,
    flp = emeteur.flp
  })
end

--creer les particules
function cr_part(x,y,c,s)
  local p={}
  p.x=x
  p.y=y
  p.c=c
  local angle=rnd(60)+270
  p.vsp=sin(angle/360)
  p.hsp=cos(angle/360)*s
  p.r=2+rnd(1)
  add(particles,p)
 end
function draw_part(p)
    circfill(p.x,p.y,p.r,p.c)
end
function update_part(p)
    p.r-=rnd(0.4)
    p.x+=p.hsp
    p.y+=p.vsp
    if (p.r<0) del(particles,p)
    if (p.r<0) del(particles,p)
end

function create_droid(type,x,y,zx1,zx2,zy1,zy2)
  if type == 33 then
    add(droids,{
      sp=type,--droid terrestre
      x=x,--position x initiale
      y=y,--position y initiale
      w=16,--width la largeur en pixel du perso
      h=16,--height la hauteur en pixel du perso
      flp=false,--flip, faux si vers la droite et vrai si vers la gauche
      dx=0,--delta x, pour la vitesse de deplacement
      max_dx=0.7,--vitesse max
      acc=0.5,--acceleration, marche de pair avec delta x
      anim=0,--animation , pour regler le temps entre chaque frame
      zonex1 = zx1, --zone ou il vagabonde entre zonex1 et zonex2
      zonex2 = zx2
    })
  else
    add(droids,{
      sp=type, -- droid volant
      x=x,--position x initiale
      y=y,--position y initiale
      w=8,--width la largeur en pixel du perso
      h=8,--height la hauteur en pixel du perso
      flp=false,--flip, faux si vers la droite et vrai si vers la gauche
      dx=0,--delta x, pour la vitesse de deplacement
      dy=1,--delta y, pour la vitesse de saut/chute
      max_dx=0.7,--vitesse max
      acc=0.5,--acceleration, marche de pair avec delta x
      anim=0,--animation , pour regler le temps entre chaque frame
      zonex1 = zx1, --zone ou il vagabonde entre zonex1 et zonex2
      zonex2 = zx2,
      zoney1 = zy1, --zone ou il vagabonde entre zoney1 et zoney2
      zoney2 = zy2
    })
  end
end
function create_checkpoint(x,y)
  add(checkpoint,{ 
    sp=112,
    x=x, --position initiale
    y=y,
    h=8,
    w=8,
    flp=false, -- vers la gauche
    anim = 0,
    }
  )
end

function collide_obj(p,o,distance)
  local py = p.y  local d = distance or 0
  if player.down and p == player then py += 8 end
  return p.x<=o.x+o.w+d and
         o.x<=p.x+p.w+d and
         py<=o.y+o.h+d and
         o.y<=py+p.h+d
end


__gfx__
00000000070000000000000000000000000000000000000000000000000000000000000000000000070000000000000000000000000000000700000000777000
079777000770000000797770007977700079777000797770079777f00079ff700000000000797770077000000079777000797770007977700770000000000700
0797ff007707977700797ff000797ff000797ff000797ff00797ff80007988f00000000000797ff07707977700797ff000797ff000797ff07700000007700070
099f1f00000797ff0099f1f00099f1f00099f1f00099f1f0099f1880009988f0000000000099f1f0000797ff0099f1f00099f1f00099f1f00007977700070007
099fff0000099f1f0099fff00099fff00099fff00099fff0099f8880009988f0000000000099fff000099f1f0099fff00099fff00099fff0000797ff07007007
00ff000000099fff000ff000000ff000000ff000000ff00000f88800000f880000000000090ff00009099fff090ff000090ff000090ff00000099f1f00700707
0088000000088f00000880000008800000088000000880000088800000088800000000009998800099988f0099988000999880009998800009099fff00070700
08888000008888000088880000888800008888000088880008888000008888000000000009598800095988000959880009598800095988009990ff0000000000
08888000088880000088880000888800008888000088880008888000008888000079777000f59ff000f5988000f59ff000f5988000f59ff00959880000000000
08888000088880000088880008888880088888800888888088888000008888000099f1f0008f5999008f5ff9008f5999008f5ff9008f599900f5988888f00000
08ff800008ff8000008ff8000ff888f00f888ff00ff888f0f8888110008888000099fff00088955900889559008895590088955900889559008f599988f00000
0888800008888000008888000088880000888800008888000888811000888800088ff80000888999008889990088899900888999008889990088955900000000
01111000011110000011110001101100001101100110110001100110001111008888888800111100001111000011110001101100001101100088899900000000
0111100001111000001111000110110000110110011011000110011000111100ff1111ff00111100001111000011110001101100001101100111111000000000
01114400011110000011110001101100001101100110110001100440001111001110011100111440001111000011110001101100001101101100001100000000
04440000044440000044440004404400004404400440440004400000004444004400004400444000004444000044440004404400004404404400004400000000
06666660000000000000000000000000000000000000000000000000000000000000000000000070000000000000000000000000000000000000000000000000
6ffffff6000060000006000000000000000000000000000060060000000000000900007009000077600000060000000000000000000000000000000000000000
6f1ff1f6000636000063600000003000000300000000000636636000000000009990007799900770b600006bb000000b00000000000000000000000000000000
ffffffff0000636666360000000003000030000000000063663600000000000009590770095900006b6666b60b0000b000000000000000000000000000000000
0ff11ff000000633336000000000003333000000000006333360000000000000079590000095900006bbbb6000bbbb0000000000000000000000000000000000
00ffff000000637337360000000003733730000000000063733600000000000007795999070959996b7bb7b60b7bb7b000000000000000000000000000000000
00055000000633333333600000003333333300000000000633336000000000007700955907709559bbbbbbbbbbbbbbbb00000000000000000000000000000000
55555555000066666666000000000000000000000000000066660000000000000000999977009999000000000000000000000000000000000000000000000000
5555555506603333333306600000333333330000666033333333066000000000bbcccccccccccccc000000000000000000000000000000000000000000000000
f555555f63363333333363360330333333330330333633333333633600000000bbbbcccccccccccc000000000000000000000000000000000000000000000000
f449944f63363333333363360330333333330330333633333333633600000000bbbbbccccccccccc000000000000000000000000000000000000000000000000
f110011f63363333333363360330333333330330666033333333633600000000b3bbbbcccccccccc000000000000000000000000000000000000000000000000
011001100660333333330660000033333333000000003333333306600000000033bbbbbccccccccc000000000000000000000000000000000000000000000000
0ff00ff0000033333333000000003333333300000000333333330000000000003bbbbbbbbccccccc000000000000000000000000000000000000000000000000
f4f0f4f000006336633600000000033003300000000063366336000000000000bbbbbbbbbbcccccc000000000000000000000000000000000000000000000000
4440444000006330033600000000033003300000000063300336000000000000bbbbbbbbbbcccccc000000000000000000000000000000000000000000000000
bbbbbbbb00000000000000cccccccccccccccccc000000000000000000000000bbbbbbbbbbbccccc000000000000000000000000000000000000000000000000
bbbbb3b3333333333333330cccc77ccccccccccc000000000000000000000000bbbbbbbbb3bbcccc000000000000000000000000000000000000000000000000
3b3bb333333333333333330ccc7777cccccccccc000000000000000000000000bb3bb3bbb3bbbccc000000077777777777777700000000007777770000000000
13333131330330330330330cc777777ccccccccc000000000000000000000000bb3333bb33b3bbcc000000077777777777777700000000777777770000000000
13431919330000330000330c77777777cccccccc000000000000000000000000bbb33bbb3bb3bbcc000000077777777777777700000077777777770000000000
4141a99900222200222000cc77777777cccccccc000000000000000000000000bbbbbbbbbbb333bc000000077777777777777700000777777700000000000000
4445a9992244442244420ccccccccccccccccccc000000000000000000000000bbbbbbbbbbbb33bc000000000000000000000000007777770099999900000000
4455999a4444444444420ccccccccccccccccccc000000000000000000000000bbbbbbbbbbbbbbbc000000000000000000000000077777000099999999900000
111111114544444544420ccccccccccc00000000000000000000000000000000b3bbbbb3bbbbbbbb000000000000000000000000077770000099999999990000
111111114444444444420ccccccccccc0000000000000000000000000000000033bbbbb3b33bbbb3000000000000000000000000777700000011111119999000
c111111c4444444444420ccccccccccc000000000000000000000000000000003bbbb3b3bb3bb3b3000000077777000000000007777700000011ccccc1999900
c11111cc4445444444420ccc4644464400000000000000000000000000000000bbbb33333b3333bc0000000777777770000000077770000001cc77777c199900
c11c1ccc4444444445420cccc6ccc6cc00000000000000000000000000000000b3b3bb33b3333bbc000000077777777700000007777000001ccc7777cc719990
c11ccccc4444444444420ccc4644464400000000000000000000000000000000b33533333333351c00000000000777777000007777000001cccc77c7cc7c1990
cc1ccccc2222222222220cccc6ccc6cc0000000000000000000000000000000033555335553555cc0000000000000777770000777700001c77ccccccc7cc1999
cccccccc0000000000000ccc55555555000000000000000000000000000000005555555555551ccc0000000000000077777000777700001c77cc7cccc7c71999
00999999b5bb555b00000000000000000000000000000000000000000000000015551151551ccccc0000000000000007777000777700001c7ccc77ccccc7c199
00900009555555550000000000000000000000000000000000000000000000004112411111cccccc0000000000000007777700777700001c7cc77cccccc7c199
009999995b5bb353000000000000000000000000000000000000000000000000442411111ccccccc0000000000000007777700777700001c7ccc7cccccc71999
00900009135331310000000000000000000000000000000000000000000000004441111ccccccccc0000000000000007777700777700001c7ccc777ccccc1999
00900009135555550000000000000000000000000000000000000000000000009441cccccccccccc00000000000000077777007777000001c7cccc77cccc1999
00900009554159590000000000000000000000000000000000000000000000004425cccccccccccc000000000000000777770077777000001c77ccc7ccc19990
999009994445a9950000000000000000000000000000000000000000000000004941cccccccccccc0000000000000007777700777770000001c77ccccc199990
99000990445595950000000000000000000000000000000000000000000000009925cccccccccccc00000000000000077777000777770000001cccccc1999900
44444444044444400044440000044000004444000000000000000000000000004525cccccccccccc000000000000000777770000777700000001111119999000
45545554045455400044540000044000004544000000000000000000000000009441cccccccccccc000000000000007777700000777770000000000009990000
44444444044444400044440000044000004444000000000000000000000000009925cccccccccccc000000000000077777700000077777000000000009900770
45554554045545400044540000044000004544000000000000000000000000004425446446444644007700000000777777000000007777770000000000077777
44444444044444400044440000044000004444000000000000000000000000004441cc6cc6ccc6cc077777000077777770000000000777777770000077777777
44444444044444400044440000044000004444000000000000000000000000009441446446444644077777777777777700000000000077777777777777777770
00044000000440000004400000044000000440000000000000000000000000004492cc6cc6ccc6cc007777777777777000000000000000777777777777777000
00044000000440000004400000044000000440000000000000000000000000005999355555555555000077777777700000000000000000007777777777700000
44444444444444444444444444444444444444444444444444444444444444444444444444444444044444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44343444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444343434444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444416161644444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444343434344444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444443434343434444444444444444444444416161616444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444040404044444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444050505054444444444444444444444444444444444444444444444444444444444444404040404
04444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444404044444444444444444444444444405050505
05444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444040444444444444444444444444444444444444444444444444405054444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444050544444444444444444444444444444404040444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
97979797979797979797353535353535354444444444444444444444444444444444444405050544444444444444444444444444040404040444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
14141414141414141414141414141414142444444444444444444444440404040404044444444444444444444444444444444444050505050544444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
15151515151515151515151515151515152544444444444444444444440505050505054444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
__label__
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111117111111111111111111111111111
11111171111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111771111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11117711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11171111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
71111111111111111111111111111111111111111117711111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111771111111111111111111111111111111111711111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111777711111111177111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111777711111111111111111111111111111111771111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111117711111111111111111111111111111111111171111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11771111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
17711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77111111111111111111111111111111111117711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
71111111111111111111111111111111111777111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111711111111111111111111111111111111111
11111111111111111111111177111111111111111111111111111111111111111111111111111111111111111111177111111111111111111111111111111111
11111111111111111111111771111111111111111111111111111111111111111111111111111111111111111111117111111111111111111111111171111111
11111111111111111111117711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111171111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111117111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111117111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111711111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111711111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111771111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111177111111111111111111111
11111111111111111111111711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111117711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111177171111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111171111111111111111777777777777777777777711111111111111177777777711111111111111111111111111111111111111111
11111111111111111111111711111111111111111777777777777777777777711111111111111177777777711111111111111111111111111111111111111111
11111111111111111111111711111111111111111777777777777777777777711111111111177777777777711111111111111111111111111111111111111111
11111111111111111111111111111111111111111777777777777777777777711111111177777777777777711111111111111111111111111111111111111111
11111111111111111111111111111111111111111777777777777777777777711111111177777777777777711111111111111111111111111111111111111111
11111111111111111111111111111111111111111777777777777777777777711111111777777777711111111111111117111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111177777777711199999999911111117111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111177777777711199999999911111117711111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111777777711111199999999999999111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111777777111111199999999999999911111111111111111111111111111111
11111111111111111111111111111111111111111111117111111111111111111111777777111111199999999999999911111111111111111111111111111111
11111111111111111117711111111111111111111111117111111111111111111177777711111111111111111111999999111111111111111111111111111111
111111111111111111171111111111111111111117777777111111111111111117777777111111111111cccccccc199999911111111111111111111111111111
111111111111111111171111111111111111111117777777111111111111111117777777111111111111cccccccc199999911111111111111111111111111111
111111111111111111171111111111111111111117777777777771111111111117777771111111111ccc77777777c11999911111111111111111111111111111
11111111111111111111111111111111111111111777777777777711111111111777777111111111cccc777777ccc77199999111111111111111111111111111
11111111111111111111111111111111111111111777777777777711111111111777777111111111cccc777777ccc77199999111111111111111111111111111
111111111111111111111111111111111111111111111117777777771111111777777111111111cccccc777cc7ccc77c11999111111111111111111111111111
11111111111111111111111111111111111111111111111111777777711111177777711111111c777ccccccccccc7ccc11999911111111111111111111111111
11111111111111111111111111111111111111111111111111777777711111177777711111111c777ccccccccccc7ccc11999911111111111111111111111111
11111111111111111111111111111111111111111111111111177777777111177777711117111c777ccc77cccccc7cc711999911111111111111111111111111
11111111111111111111111111111111111111111111111111111777777111177777711117111c77cccc777cccccccc7cc199911111111111111111111111111
11111111111111111111111111111111111111111111111111111777777111177777711111111c77cccc777cccccccc7cc199911111111111111111111111111
11111111111111111111111111111111111111111111111111111777777711177777711111111c77ccc777ccccccccc7cc199911111111111111111111111111
11111111111111111111111111111111111111111111111111111777777711177777711111111c77cccc77ccccccccc711999911111111111111111111111111
11111111111111111111111111111111111111111111111111111777777711177777711111111c77cccc77ccccccccc711999911111111111111111111111111
11111111111111111111111111111111111111111111111111111777777711177777711111111c77cccc77777ccccccc11999911111111111111111111111111
111111111111111111111111111111111111111111111111111117777777111777777111111111cc7cccccc777cccccc11999911111111111111111111111111
111111111111111111111111111111111111111111111111111117777777111777777111111111cc7cccccc777cccccc11999911111111111111111111111111
11111111111111111111111111111111111111111111111111111777777711177777777111111111c777ccccc7ccccc199999111111111111111111111111111
111111111111111111111111111111111111111111111111111117777777111777777771111111111cc777ccccccc11999999111111111111111111111111111
111111111111111111111111111111111111111111111111111117777777111777777771111111111cc777ccccccc11999999111111111111111111111111111
11111111111111111111111111111111111111111111111111111777777711111777777711111111111ccccccccc199999911111111111111111111111111111
11111111111111111111111111111111111111111111111111111777777711111177777711111111111111111111999999111111111111111111111111111111
11111111111111111111111111111111111111111111111111111777777711111177777711111111111111111111999999111111111111111111111111111111
11111111111111111111111111111111111111111111111111177777777111111177777777111111111111111111999911111111111111111111111111111111
11111111111111111111111111111111111111111111111111777777777111111111777777711111111111111111999111777111111111111111111111111111
11111111111111111111111111111111111111111111111111777777777111111111777777711111111111111111999111777111111111111111111111111111
11111111111111111111111111117711177711111111111177777777711111111111177777777711111111111111111777777711111111111111111111111111
11111111111111111111111111111711777777711111177777777777111111111111111777777777777111111177777777777711111111111111111111111111
11111111111111111111111111111711777777711111177777777777111111111111111777777777777111111177777777777711111111111111111111111111
11111711111111111111111111111111777777777777777777777711111111111111111177777777777777777777777777777111111111111111111111111111
11111711111111111111111111111111177777777777777777777111111111111111111111177777777777777777777777111111111111111111111111111111
11111711111111111111111111111111177777777777777777777111111111111111111111177777777777777777777777111111111111111111111111111111
11111171111111111111111111111111111177777777777777111111111111111111111111111177777777777777777111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111117111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111117711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111771111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111117111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111177111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111171111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111771111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111711111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111999111111991999199919991111199919991991199911111999191911111999199919991199199911991999199919191111111111111
71111111111111111111919111119111919199919111111199919191919191111111919191911111999119119191911191119111191119119191111111111111
11111111111111111111999111119111999191919911111191919991919199111111991199911111919119119991911199119991191119119911111111111111
11111111111111111111919111119191919191919111111191919191919191111111919111917711919119119191919191111191191119119191111111111111
11111111111111111111919111119991919191919991111191919191999199911111999199971111919199919191999199919911191199919191111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111771111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111117711111111111111111111111111111111
71111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111171111111111111111111111111111111111
71111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111177771111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111177711111111111111111111111111111111111111111111111
11111111111111111111111111117999199919991199119911111199999111111999119911111799199919991999199911911111111111111111111111111111
11111111111111111111111111118989898989811981198111111998989911118891198911111981889189898989889118911111111111111111111111111111
11111111111111111111111111118999899189918999899911118999199911111891898911118999189189998991189118977111111111111111111111111111
11111111111111111111111111118981891989118889888977118991989911111891898911118889189189898919189118771111111111111111111111111111
11111111111111111111111111118911898989991991199117778899999111111891899111111991189189898989189177911111111111111111111111111111
11111111111111111111111111118111818188818811881111111888881111111811881111118811181181818181181118111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111

__gff__
0000000000000000000400000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000001030300000000000000000000000000000303000000000000000000000000000005000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4444444444444444444444444444444444444444445144444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4443434444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444443434344444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444443434343444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444434343434344444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444404142444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444445464744444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4440414142444455565744444444444444444444404141424444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444465666744444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
7744444444444475767753535353535353535344444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4141414141414141414141414141414141414142444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
5151515151515151515151515151515151515152444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444041424444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
__sfx__
010d00001d7351a535225351a535187351f535225351a535187351f535225351a535187351f535225351a535187351f535225351a535187351f535225351a535187351f535225351a535187351f535225351f535
010702000065400651006510064100641006510063100641006410063100621006110062100611006110061500000000000000000000000000000000000000000000000000000000000000000000000000000000
011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000001f7521f7421f7521f7421d7521d7421d7521d7421c7521c7421a7521a7421f7521f74226752267421f7521f7421f7521f7421d7521d7421d7521d7421c7521c7421d7521d7421f7521f7421a7521a742
011000001f7521f7421f7521f7421d7521d7421d7521d7421c7521c7421a7521a7421f7521f74226752267421f7521f7421f7521f7421d7521d7421d7521d7421f7521f7421d7521d7421c7521c7421a7521a742
011000001d7501d7501c7501c7501a7501a75019750167501575015750157501575015750157501575015750187001870018700187001870018700187000c7000c7000c7000c7000c7000c7000c7000070000700
011000000000000000000000000000000000000000000000097220972209722097220972209722097220972200002000000000000000000000000000000000000000000000000000000000000000000000000000
011000000000000000000000000000000000000000000000045220452204522045220452204522045220452200000000000000000000000000000000000000000000000000000000000000000000000000000000
010800001c0441c0351c0041c0051c0041c0051c0041c005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01100000137500c7000c7000c700137500c7000c7000c700137500c7000c7000c700137500c7000c7000c700137500c7000c7000c700137500c7000c7000c700137500c7000c7000c700137500c7000c70015750
01100000020300000000000000000203000000000000000002030000000000000000020300000000000000000203000000000000000002030000000000000000020300000000000000000203000000000000e030
011000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000000000000000000000000000000000000000000000000000000000000000003461534615346153461500000000000000000000000000000000000000000000000000000000000034625346153461534625
011000001d7541d7501d7501f75020750207502075020750007000070000700007000070000700007000070025750257502575025750247502475024750247550070000700007000000000000000000000000000
011000001d7541d7501d7501f75020750207502075020750007000070000700007000070000700257542575027750277502775027750227502275022750227502475024750247502475500700007000070000700
__music__
04 41014344
42 02444444
41 03744444
42 04444474
44 05060744
44 08444444
41 090a4b0c
40 090a0d0c
42 090a0e0c
44 44444444
44 44444444
44 44444444
44 44442424
44 44444444
54 45454545
40 04040404
41 14141414
44 44444444
44 44444444
44 44444444
44 44444444
44 44444444
44 44444444
44 44444444
44 44444444
44 44444444
44 44444444
44 44444444
44 44444444
44 44444444
44 44444444
44 44444444
44 44444444

