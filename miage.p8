pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

keys={btns={},ct={}}
olivier="aaaaaaaaaa33333333333aa333a33aaaaaaaaaaaa3333333333333333333333aaaaaaaa333303333333333330333333aaaaaa3333333333333333333333333aaaaaaa333333333333303333333333aaaaaaaaa33333a3333333333330333333aaaaaaaaa333a3333333333333333303aaaaaaaaaaa333333333033333333333aaaa3aaaa33333333333033333333333a3333a3a333a3333333333333333333333333a333333a33333333333303333333a333a3333a33033a333333333aa33333333033333a33333a3333333333333333333333333333333333333330333333333333333333333333333333333333333a3333333333033a33333333333333330a3333333333333355333330333333a33a333330333333333533333333a333333a333333333333353535333335aaa553aaa333333333333a355553333aa5555aaaa33333533aa33a35555a53555555aaaaaaa3333553335555555a5555555aaaaaaaaaaaa535555555555555555aaaaaaaaaaaaaaaa55555555555555aaaaaaaaaaaaaaaaaaaaa55555555555aaaaaaaaaaaaaaaaaaaaaa555555555aaaaaaaaaaaaaaaaaaaaaaaa555555555aaaaaaaaaaaaaaaaaaaaaaa555555555aaaaaaaaaaaaaaaaaaaaaaa555555555aaaaaaaaaaaaaaaaaaaaaaa555555555aaaaaaaaaaaaaaaaaaaaaa5555555555aaaaaaaaaaaaaaaaaaaaaa55555555555aaaaaaaa"
pin="aaaaaaaaaaa33333333333aaaaaaaaaaaaaaaaaaaaa33333333333aaaaaaaaaaaaaaaaaa33333303333333303aaaaaaaaaaaa33333333333333333333333aaaaaaaaa33333333333333333333333aaaaaa3333333333333333033333333333aaa33330333303333333333333303333aa3333333333333333333333333333333333333333333333333333333333333333333333333333333333333033333303333033333333333333333344333333333333333433333333333344443333333333aa333444333330333344443aa3333333aa333034333333333344443aa0343333aa333334333333333344333aaa344303aaaaa33443334aa33344aaaaa44444aaaaaaa33344334aa44444aaaa444444aaaaaaaaaa44a44aa44a4444a4444aaaaaaaaaaaaa44444aa44444444444aaaaaaaaaaaaaa44444aa444aa44444aaaaaaaaaaaaaaaaaa4444a44aaa44aaaaaaaaaaaaaaaaaaaaa444444aa444aaaaaaaaaaaaaaaaaaaaaa44444aa444aaaaaaaaaaaaaaaaaaaaaa4444aaa44aaaaaaaaaaaaaaaaaaaaaaa4444aaa44aaaaaaaaaaaaaaaaaaaaaaaaa4444444aaaaaaaaaaaaaaaaaaaaaaaaa4444444aaaaaaaaaaaaaaaaaaaaaaaaa44444aaaaaaaaaaaaaaaaaaaaaaaaaaa44444aaaaaaaaaaaaaaaaaaaaaaaaaaa44444aaaaaaaaaaaaaaaaaaaaaaaaa444444444aaaaaaaaaaaaaaaaaaaaaaa444444444aaaaaaaaaa"
logo_miage="1111111111111111111111111111111111111111111111111111111111111111111111111777111111111111111111111111111111111111111111111111111111111111111111111111111111111111111117777777771111111111111111111111111111111111111177777777777777777777777777777111111111111111111117777777777711111111111111111111111111111111111111777777777777777777777777777771111111111111111177777777777777111111111111111111111111111111111111117777777777777777777777777777711111111111111177777777777777771111111111111111111111111111111111111177777777777777777777777777777111111111111177777777777777777711111111111111111111111111111111111111777777777777777777777777777771111111111117777777777777777777111111111111111111111111111111111111177777777777777777777777777777711111111111777777777777777777771111111111111111111111111111111111111777777777777777777777777777777111111111177777777777777777777111111111111111111111111111111111111111111111111111111111111111111111111111117777777777777771111111111111111111111111111111111111111111111111111111111111111111111111111111111777777777777711111999999999111111111111111111111111111111111111111111111111111111111111111111111177777777777711119999999999999999111111111111111111111111111111111111111111111111111111111111111117777777777771111999999999999999999911111111111111111111111111111111111111111111111111111111111111777777777771111111999999999999999999991111111111111111111111111111111111111111111111111111111111177777777777111111119999999999999999999991111111111111111111111111111111111111111111111111111111111777777777711111111199999999999999999999991111111111111111111111111111111111111111111111111111111177777777771111111111199991111199999999999991111111111111111111117777777711111111111111111111111111777777777111111111111111111111111199999999991111111111111111111177777777777711111111111111111111177777777711111111111111111111111111119999999991111111111111111111777777777777771111111111111111111777777777111111111111111ccc777ccc111119999999991111111111111111177777777777777777111111111111111177777777711111111111111ccc777777777c71119999999991111111111111111777777777777777777111111111111111777777777111111111111cccc7777777777c7711199999999111111111111111177777777777777777777111111111111177777777111111111111cccc777777777cccc77111999999991111111111111117777777777777777777771111111111177777777711111111111ccccc777777777cccc77711199999991111111111111117777777777777777777777111111111177777777711111111111ccccc7777777777cccc77c111999999911111111111111111111111777777777777771111111117777777711111111111cccccc7777cc7777cccc777c119999999111111111111111111111111177777777777711111111177777777111111111117777ccc777ccc7cc777cc77c1119999991111111111111111111111111117777777777711111117777777771111111111c77777ccccccccccccc77c77cc119999999111111111111111111111111111777777777771111117777777711111111111777777cc77cccccccc777c777c11999999911111111111111111111111111117777777777111111777777771111111111cc7777ccc777ccccccc777cc77c11999999911111111111111111111111111111777777777711111777777771111111111cc7777ccc777cccccc777cccc7711199999911111111111111111111111111111177777777711111777777771111111111cc777ccc7777ccccccccccccc7711199999911111111111111111111111111111117777777771111777777771111111111ccc77ccc7777cccccccccccccc711199999911111111111111111111111111111117777777771111777777771111111111ccc77cc7777cccccccccccccc7711199999911111111111111111111111111111111777777771111777777771111111111ccc77cc7777cccccccccccccc77119999999111111111111111111111111111111117777777711117777777771111111111cc777cc7777ccccccccccccc77119999999111111111111111111111111111111117777777711117777777771111111111ccc777c77777cccccccccccc77119999999111111111111111111111111111111111777777771111777777771111111111cccc777c7777cccccccccccc775199999911111111111111111111111111111111117777777711117777777711111111111cccc777c7777cccccccccccc11999999911111111111111111111111111111111117777777711117777777711111111111cccc7777c7777cccccccccc1119999999111111111111111111111111111111111177777777111177777777711111111111cccc777cc777cccccccccc11999999911111111111111111111111111111111111777777771111177777777111111111111ccc777cc777ccccccc771119999999111111111111111111111111111111111117777777711111777777777111111111111cc7777c777ccccccc7111999999911111111111111111111111111111111111177777777111117777777771111111111111cc7777777cccccc1111999999991111111111111111111111111111111111177777777111111177777777711111111111111c777c777cccc111199999999111111111111111111111111111111111111777777771111111777777777111111111111111117cc7cc1111199999999911111111111111111111111111111111111117777777711111111777777777111111111111111111111111199999999999111111111111111111111111111111111111777777777111111117777777777111111111111111111111111999999999911111111111111111111111111111111111177777777711111111117777777777111111111111111111111119999999991111111111111111111111111111111111111777777777111111111177777777777111111111111111111111199999999117111111111111111111111111111111111177777777771111111111177777777777111111111111111111111199999111777111111111111111111111111111111117777777777111111111111177777777777111111111111111111111999111177777111111117771111111111111111111777777777711111111111111177777777777711111111111111111111111177777777111117777771111111111111111777777777777111111111111111677777777777771111111111111111111177777777777111177777777111111111111177777777777711111111111111111677777777777777111111111111111177777777777777117777777777771111111777777777777771111111111111111111777777777777777777111111177777777777777777711777777777777777777777777777777777111111111111111111111177777777777777777777777777777777777777771117777777777777777777777777777777711111111111111111111111177777777777777777777777777777777777777111117777777777777777777777777777771111111111111111111111111177777777777777777777777777777777777711111111777777777777777777777777777111111111111111111111111111117777777777777777777777777777777711111111111777777777777777777777777711111111111111111111111111111111777777777777777777777777777711111111111111177777777777777777777111111111111111111111111111111111111177777777777777777777777711111111111111111117777777777777777111111111111111111111111111111111111111111777777777777777777111111111111111111111111117777777771111111111111111111111111111111111111111111111111777777777711111111111111111"
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
end

function _dtb_nexttext()
  if dtb_queuf[1]~=0 then -- ~= ===> not egal
   dtb_queuf[1]()
  end
  del(dtb_queuf,dtb_queuf[1])
  del(dtb_queu,dtb_queu[1])
  _dtb_clean()
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
rectfill(cam_x+2,cam_y+124-dislineslength*8,cam_x+126,cam_y+126,7)
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
  pnj={}
  pnjs={}
  blocs = {}
  nbr_bloc = 0
  create_p_volant(124,61,3,108,156) --dessine 2 bloc en (124,61*8) qui se deplace de (108,61*8) en (156,61*8)
  create_p_volant(424,61,3,408,456)
  guitare={
    sp = 42,
    x = 710,
    y = 480,
    w = 8,
    h = 8,
    anim = 0
  }
  create_pnj("tounsi",44,624,480)
  create_pnj("renevier",39,104,296)
  for i=1,200 do
    add(sparks,{
      x=0,y=0,velx=0,vely=0,
      r=0,alive=false
    })
  end
  create_checkpoint(592,488)
  --simple camera
  cam_x=0
  cam_y=0
  -- variable globale
  game_state="menu"
  gravity=0.3
  friction=0.85
  interaction = false
  start_bulle = false
  checkpointx = 10 --pour memoriser le dernier checkpoint
  checkpointy = 460
  checkpoint_number = 0 --pour l'animation du checkpoint
  spnum = 0
  guit_found = false --si buffa a trouver la guitare
  tmp = 0
  reattak = true --pour creer un delai entre les attaques
  level=1
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
    if dialog then
      dialog_update()
    else
      player_update()
      droid_update()
      droid_animate()
      if guit_found then
        player_guit_animate()
      else
        player_animate()
      end
    end
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
    if level == 2 then
      cam_y = 224
    else
      cam_y=player.y-64+(player.h/2)
      if cam_y<map_start then
        cam_y=map_start
      end
      if cam_y>mapy_end-128 then
        cam_y=mapy_end-128
      end
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
  foreach(blocs,update_pv)
  for i=1,#blocs do
    collide_pv(blocs[i][1],blocs[i][#blocs[i]])
  end
  keys:update()
  camera(cam_x,cam_y)
end




function _draw()
  cls()
  --menu
  if game_state == "menu" then
    intro()
  elseif game_state == "plot" then
    plot()
  elseif game_state == "game"  then
    cls()
    map(0,0,0,0,128,64)
    if level ==1 then
      --dessine les arbres
      if (player.x < 300) then
        str_to_spr(pin,44,464,32,32)
      elseif player.x < 720 then
        str_to_spr(olivier,530,464,32,32)
        str_to_spr(pin,595,464,32,32)
      else
        str_to_spr(olivier,800,464,32,32)
        str_to_spr(pin,895,464,32,32)
        str_to_spr(olivier,970,464,32,32)
      end
    elseif level == 2 then
      print("EXIT",365,288,rnd(15))
    end
    --dessine les checkpoints
    for check in all(checkpoint) do
      spr(check.sp,check.x,check.y,1,1,check.flp)
    end
    --dessine les npc
    for pn in all(pnjs) do
      spr(pn.sp,pn.x,pn.y,1,2)
    end
    for droid in all(droids) do
      spr(droid.sp,droid.x,droid.y,droid.w/8,droid.h/8,droid.flp)
    end
    --dessine les platformes volantes
    for bloc in all(blocs) do
      for i=1,#bloc do
        spr(bloc[i].sp,bloc[i].x,bloc[i].y)
      end
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
    if interaction then drawx(pnj.x ,pnj.y - 8) end
    if dialog  then dialog_draw() end
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
  end
  if (mget(x1,y2) == 97 ) then
    explode_titles(x1,y2)
  end
  if (mget(x2,y1) == 97 ) then
    explode_titles(x2,y1)
  end
  if (mget(x2,y2) == 97 ) then
    explode_titles(x2,y2)
  end
end

function explode_titles(x,y)
  if del_title== 0 then
    mset(x,y,103)
    for i=0,6 do
      cr_part(x*8+4,y*8+4,7,0)
    end
    del_title=12 
  else
    del_title -= 1
  end
end
-- -->8
-- --player

function dialog_update()
  dtb_update()
  if btn(0) then
    gauche = true
  end
  if btn(1) then
    gauche = false
  end
end

function dialog_draw()
  dtb_draw()
  if talked then
    if  #dtb_queu == 0 then 
      dialog=false 
      talked = false
      if level == 1 then 
        music(6) -- on reset !!!!!!!!!!!!!
      elseif level == 2 then 
        music(9)
      end
    end
  else
    music(1) -- on active l'effet !!
    if pnj.name=="renevier" then
      dtb_disp("buffa:tiens qui voila, mister renevier.")
      dtb_disp("renevier:michel aide moi ! j'ai perdu le controle de mon android studio ! c'est la panique.")
      dtb_disp("buffa:pff...pathetique.")
      talked = true
    end
    if pnj.name=="tounsi" then
      dtb_disp("buffa:salut steph.")
      dtb_disp("tounsi:bonjour michel il parait que tu aimes la musique ? la clef de l'excellence c'est de savoir se diversifier !")
      dtb_disp("buffa:tu leurs parle comme ca a tes eleves ?")
      talked = true
    end
  end 
end

function player_update()
  --physics
  player.dy+=gravity
  player.dx*=friction

  --controls
  if not player.down then
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

  --fire
  if keys:down(4) and not player.down  and guit_found and reattak then
    add_projectil(player)
    player.attak = true
  else
    player.attak = false
  end
  --se baisser
  if keys:held(3) and not player.falling and not player.jumping and player.landed then
    player.down = true
  else
    player.down = false
  end
  --jump
  if keys:down(2) and player.landed then
    player.dy-=player.boost
    player.landed=false
  end
  --double jump
  if keys:down(2) and (player.jumping or player.falling) and player.doublejump then
    player.dy=0
    -- for i=1,6 do
    --   cr_part(player.x+player.w/2+player.dx,player.y+player.h,7,1)
    --   cr_part(player.x+player.w/2+player.dx,player.y+player.h,7,-1)
    --  end
    player.dy-=player.boost*0.7
    player.doublejump=false
 end
  --check collision up and down
  if player.dy>0 then
    player.falling=true
    player.landed=false
    player.jumping=false
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
    if collide_map(player,"down",3) and not player.running then
      if blocs[1][1].flp then
        player.x -= 1
      else
        player.x +=1
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
  if collide_map(player,"left",4) and level == 1 then
      checkpointx=8 checkpointy=296
      player.x = 8 player.y = 296
      level=2
      sfx(0)
      music(9)
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
  if collide_obj(player,pnjs[1],8) then
    interaction = true
    pnj = pnjs[1]
  elseif collide_obj(player,pnjs[2],8) then
    interaction = true
    pnj = pnjs[2]
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

  if keys:down(5) and interaction and #dtb_queu==0 then
    interaction = false
    dialog = true
  end
  player.x+=player.dx
  player.y+=player.dy

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
      del_droid -= 1
      if del_droid < 15 then
        droid.dx = 0
        if del_droid < 7 and del_droid > 2 then
          add_projectil(droid)
        end
      else
        droid.dx*=friction
        --movement
        if droid.flp then
          droid.dx-=droid.acc
        else
          droid.dx+=droid.acc
          end
        if droid.x < droid.zonex1  then
          droid.flp = false
        end
        if droid.x > droid.zonex2 then
          droid.flp = true
        end
        droid.x+=droid.dx
      end  
      if del_droid < 0 then
        del_droid = 100
      end
    else
      droid.dx*=friction
      --movement
      if droid.flp then
        droid.dx-=droid.acc
      else
        droid.dx+=droid.acc
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
  if time()-tmp>.2 then  
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
      if del_droid > 12 then
        if time()-droid.anim>.2 then
          droid.anim=time()
          droid.sp+=2
          if droid.sp>35 then
            droid.sp=33
          end
        end
      else
        droid.sp = 37
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
      projectil.x -= 5.5
    else
      projectil.x += 5.5
    end
    for droid in all(droids) do
      --check collision des projectils
      if  collide_map(projectil,"right",0)
      or collide_map(projectil,"left",0)
      or (collide_obj(projectil,droid) and projectil.sp == 96)
      or (collide_obj(player,projectil) and projectil.sp == 81)
      or projectil.x > cam_x+128
      or projectil.x <  cam_x-8 then
        del(projectils,projectil)
        if (collide_obj(projectil,droid) and projectil.sp == 96) then
          explosion(droid.x,droid.y,droid.w/4+1,100)
          del(droids,droid)
          sfx(1)
        elseif collide_obj(player,projectil) then
          player_dead()
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
  str_to_spr(logo_miage,16,16,98,64)
  --sspr(80, 32, 48, 32,27,37,80,48) -- draw the 48 x 64 image from (80, 32) at screen location (27, 37) but stretched to 80 x 48
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
  explosion(player.x+player.w/2,player.y+player.h/2,2,50,8)
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
    boost=4,--  marche de pair avec delta y 
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
    projectils={}
    --droid terrestre sprite 33
    create_droid(33,806,480,768,816) --dessine le sprite 33 à (110,480) se deplacant de (0,480) à (120,480)
    create_droid(33,964,480,912,944)
    --droid volant sprite 42
    create_droid(42,208,288-24,176,224,272,296) 
    create_droid(42,248,280,230,260,272,296)
    create_droid(42,280,288,270,296,272,296)
    create_droid(42,336,288,320,360,272,296)
    --platform volant sprite 64
    chrono=0 --sert pour animé le press x to play
    hit = false --si buffa a pris un coup
    del_acc = 40 -- pour creer un delay
    del_droid = 3
    del_title=12
    gauche = true -- pour le qcm highlight
    dialog = false
    talked = false
    if level == 1 then
      music(6) -- on reset la musique 
    elseif level == 2 then
      music(9)
    end
end
function add_projectil(emeteur)
  local emx = 0
  if not emeteur.flp then 
    emx = emeteur.x + emeteur.w/2
  else
    emx = emeteur.x
  end
  add(projectils,{
    sp = emeteur.proj,
    x = emx,
    y = emeteur.y,
    w = 8, -- besoin de sa largeur et hauteur pour collide map
    h = 6,
    flp = emeteur.flp,
    c = emeteur.cp
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

function update_pv(p)
  for i=1,#p do
    if p[i].flp then
      p[i].x -=1
    else
      p[i].x+=1
    end
    if p[i].x < p[i].x1 then p[i].flp=false end
    if p[i].x > p[i].x2 then p[i].flp=true end
  end
end

function collide_pv(f,l)
  mset(f.x/8-1,f.y/8,103)
  mset(l.x/8+1,l.y/8,103)
  mset(f.x/8,f.y/8,98)
  mset(l.x/8,l.y/8,98)
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
      zonex2 = zx2,
      proj = 81,
      cp = 11
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
    anim = 0
    }
  )
end
function create_pnj(n,sp,x,y)
  add(pnjs,{
    name=n,
    sp=sp,
    x=x,
    y=y,
    w=8,
    h=16
  })
end


function create_p_volant(x,y,l,x1,x2)
  nbr_bloc +=1
  blocs[nbr_bloc] = {}
  for i=0,l-1 do
    add(blocs[nbr_bloc],{ 
      sp=64,
      x=x+i*8, --position initiale
      y=y*8,
      h=8,
      w=8,
      flp=false, -- vers la gauche
      f = 84,
      x1=x1+i*8,
      x2=x2+i*8
      }
    )
  end
end



function collide_obj(p,o,distance)
  local py = p.y  local d = distance or 0
  if player.down and p == player then py += 8 end
  return p.x<=o.x+o.w+d and
         o.x<=p.x+p.w+d and
         py<=o.y+o.h+d and
         o.y<=py+p.h+d
end


 function str_to_spr(s,x,y,w,h)
  for yy=0,h-1 do
   for xx=0,w-1 do
    local n=0
    local s=sub(s,xx+yy*w+1,xx+yy*w+1)
    if s~="a" then
      n=("0x"..s)+0
      pset(x+xx,y+yy,n)
    end
   end
  end
 end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000777000
079777000000000000797770007977700079777000797770079777f00079ff700000000000797770000000000079777000797770007977700000000000000700
0797ff000079777000797ff000797ff000797ff000797ff00797ff80007988f00000000000797ff00007977700797ff000797ff000797ff00000000007700070
099f1f0000797ff00099f1f00099f1f00099f1f00099f1f0099f1880009988f0000000000099f1f0000797ff0099f1f00099f1f00099f1f00007977700070007
099fff000099f1f00099fff00099fff00099fff00099fff0099f8880009988f0000000000099fff000099f1f0099fff00099fff00099fff0000797ff07007007
00ff00000099fff0000ff000000ff000000ff000000ff00000f88800000f880000000000090ff00009099fff090ff000090ff000090ff00000099f1f00700707
008800000088f000000880000008800000088000000880000088800000088800000000009998800099988f0099988000999880009998800009099fff00070700
08888000088880000088880000888800008888000088880008888000008888000000000009598800095988000959880009598800095988009990ff0000000000
08888000088880000088880000888800008888000088880008888000008888000079777000f59ff000f5988000f59ff000f5988000f59ff00959880000000000
08888000088880000088880008888880088888800888888088888000008888000099f1f0008f5999008f5ff9008f5999008f5ff9008f599900f5988888f00000
08ff800008ff8000008ff8000ff888f00f888ff00ff888f0f8888110008888000099fff00088955900889559008895590088955900889559008f599988f00000
0888800008888000008888000088880000888800008888000888811000888800088ff80000888999008889990088899900888999008889990088955900000000
01111000011110000011110001101100001101100110110001100110001111008888888800111100001111000011110001101100001101100088899900000000
0111100001111000001111000110110000110110011011000110011000111100ff1111ff00111100001111000011110001101100001101100111111000000000
01114400011110000011110001101100001101100110110001100440001111001110011100111440001111000011110001101100001101101100001100000000
04440000044440000044440004404400004404400440440004400000004444004400004400444000004444000044440004404400004404404400004400000000
06666660000000000000000000000000000000000000000000000000000000000000000000000070000000000000000000000000001111111111911000000000
6ffffff6000060000006000000000000000000000000600600000000005555500900007009000077600000060000000000555550001111111111191000000000
6f1ff1f600063600006360000000300000030000000636636000000000ff55509990007799900770b600006bb000000b05fffff5000001111111009000000000
ffffffff00006366663600000000030000300000000063663600000000d1dd5009590770095900006b6666b60b0000b005f1f1f5000011111111109000000000
0ff11ff000000633336000000000003333000000000006333360000000ffff50079590000095900006bbbb6000bbbb000fff5fff00007f5fff5f709000000000
00ffff000000637337360000000003733730000000006337360000000000ff0007795999070959996b7bb7b60b7bb7b000f555f0000075f5f5f5700000000000
00055000000633333333600000003333333300000006333360000000500333307700955907709559bbbbbbbbbbbbbbbb000fff000000fffffffff00000000000
5555555500006666666600000000000000000000000066660000000050033330000099997700999900000000000000000ddd7ddd00000ff555ff000000000000
5555555506603333333306600000333333330000666033333333066055533330007777770000000005555555055555550ddd7ddd000000f555f0000000000000
f555555f6336333333336336033033333333033033363333333363360ff33330007aaaaa0000000005117715057111750fdd7ddf000000088800000000000000
f449944f63363333333363360330333333330330333633333333633600033330007aaaa90000000005771115051771150fdd7ddf000088888888800000000000
f110011f63363333333363360330333333330330666033333333633600033330007aaa9a0000000005111775057111750fdd7ddf000088888888800000000000
0110011006603333333306600000333333330000000033333333066000001110007aaa9a00000000055555550555555500111110000088888888800000000000
0ff00ff000003333333300000000333333330000000033333333000000001110007aaaa900000000656565656565656500111110000088888888800000000000
f4f0f4f000006336633600000000033003300000000063366336000000001110007aaaaa00000000555555505555555000111110000088888888800000000000
44404440000063300336000000000330033000000000633003360000000444400077777700000000000000000000000000444440000000888880000000000000
bbbbbbbb44444444cc3b3bcccccccccc666666666666666644444444699999960000000000000000000000000000000000000000000000000000000000000000
bbbbb3b344444444c3b3bbbccccccccc666666666666666649999994667777660000000000000000000000000000000000000000000000000000000000000000
3b3bb33344444444333bbbb3cccccccc666666666666666649111194666666660000000000000000000000000000000000000000000000000000000000000000
1333313144444444bbbbbbbb46444644666666669999999949177194666666660000000000000000000000000000000000000000000000000000000000000000
1343141444444444333bbb3bc6ccc6cc666666669595959549111194666666660000000000000000000000000000000000000000000000000000000000000000
414144444444444433b3b3bb46444644666666665555555549999994666666660000000000000000000000000000000000000000000000000000000000000000
4444444444444444cb333bbcc6ccc6cc666666665555555549999994666666660000000000000000000000000000000000000000000000000000000000000000
4444444444444444ccc49ccc55555555666666665d5d5d5d49999994666666660000000000000000000000000000000000000000000000000000000000000000
cccccccc0000000000000000ccc6556666556ccc0000000049559994006666660000000000000000000000000000000000000000000000000000000000000000
ccc77ccc0000000000000000ccc6556666556ccc0000000049999994006666660000000000000000000000000000000000000000000000000000000000000000
cc7777cc3333333300000000ccc6c666666c6ccc0000000049999994000446660000000000000000000000000000000000000000000000000000000000000000
c777777cbbbbbbbb00000000ccc6c666666c6ccc0000000049999994000146660000000000000000000000000000000000000000000000000000000000000000
77777777bbbbbbbb00000000ccc6c666666c6ccc0000000049999994000146660000000000000000000000000000000000000000000000000000000000000000
777777773333333300000000ccc6c666666c6ccc0000000049999994000146660000000000000000000000000000000000000000000000000000000000000000
cccccccc0000000000000000ccc6c666666c6ccc0000000049999994000146660000000000000000000000000000000000000000000000000000000000000000
cccccccc0000000000000000ccc6c666666c6ccc0000000044444444000146660000000000000000000000000000000000000000000000000000000000000000
00999999bbbbbbbbccccccccccc6c666666c6ccc4444444444444444cccccccc0000000000000000000000000000000000000000000000000000000000000000
00900009bbbbb3b3ccccccccccc6c666666c6ccc4444444444444444cccccccc0000000000000000000000000000000000000000000000000000000000000000
009999993b3bb333ccccccccccc6556666556ccc7555557dddddddddcccccccc0000000000000000000000000000000000000000000000000000000000000000
0090000913333131cccccccc64465566665564647111117666666666cccccccc0000000000000000000000000000000000000000000000000000000000000000
0090000913431414cccccccc6cc6cc6666c6cc6c7117117666666666cccccccc0000000000000000000000000000000000000000000000000000000000000000
0090000941414444cccccccc64464466664644647177717666666666cccccccc0000000000000000000000000000000000000000000000000000000000000000
9990099944445444cccccccc6cc6cc6666c6cc6c7555557666666666cccccccc0000000000000000000000000000000000000000000000000000000000000000
9900099044445544cccccccc55555566665555556dddddd666666666cccccccc0000000000000000000000000000000000000000000000000000000000000000
4444444404444440004444000004400000444400dddddddddddddddd445445440000000000000000000000000000000000000000000000000000000000000000
45545554045455400044540000044000004544005555555555555555445445440000000000000000000000000000000000000000000000000000000000000000
44444444044444400044440000044000004444004777777777776654222222220000000000000000000000000000000000000000000000000000000000000000
45554554045545400044540000044000004544004711117111176654666665660000000000000000000000000000000000000000000000000000000000000000
44444444044444400044440000044000004444004711117111176654665666560000000000000000000000000000000000000000000000000000000000000000
44444444044444400044440000044000004444004711117111176654566666660000000000000000000000000000000000000000000000000000000000000000
00044000000440000004400000044000000440004711117111176654222222220000000000000000000000000000000000000000000000000000000000000000
00044000000440000004400000044000000440004777777777776654666666660000000000000000000000000000000000000000000000000000000000000000
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777725252525f7f784847676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
44744444744444744474444444744444444474444474444444744474444444744444447444447444447444744444744425252525f7f784847676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444425252525f7f784847676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444425252525f7f784847676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444425252525f7f784847676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
54645454545454545454545454545454645454545454545454545454545454645454545454545454545454545454645425252525f7f784847676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
44654444444444444444444444444444654444444444444444444444444444654444444444444444444444444444654425252525f7f784847676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777725252525f7f784847676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f72525252525252525252525252525252525252525252525252525252525252525f7f784847676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
25252525252525252525252525252525252525252525252525252525252525a6a6a6a6a6a6a62525252525252525252525252525f7f784847676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
25252525252525252525252525252525252525252525252525252525252525a6a6a6a6a6a6a62525252525252525252525252525f7f784847676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
25252525252525252525252525252525252525252525252525252525252525a6a6a6a6a6a6a62525252525252525252525252525f7f784847676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
26262626262626262626262626262626262626262626262626262626262626262626262626262626262626262626262626262626262626767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
26262626262626262626262626262626262626262626262626262626262626262626262626262626262626262626262626262626262626767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
26262626262626262626262626262626262626262626262626262626262626262626262626262626262626262626262626262626262626767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676267676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676763566666666666666666666666666664576767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676767676767676767676767676760505050505057676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676763566665656665656665656665656664576767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676763566666666666666666666666666664505050505767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767605050505057676767676767605057676767676767676
76767676767676767676767676050505053544444444444444444444444444444576767676767676767676767676767676767676767676767676767676767676
76050505050505767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676763566565666565666565666565666664576767676767676767676767676767676767676767676767676050505057676
76767676767676767676767676760505050576767676767676760505057676767676767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676763566666666666666666666666666664576767676767676767676767676767605050505767676767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
76760505057676767676767676767676763544444444444444444444444444444576767676760505057676767676767676767676767676767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676763566665656665656665656665656664576767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676763566666666666666666666666666664576767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676763544444444444444444444444444444576767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767676767676767676760404767676767676767676767676767676767676
76767676767676767676767676767676763566565666565666565666565666664576767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676767676767676767676767676761616167676767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676763566666666666666666666666666664576767676767676767676767676767676767676767676767676767676767676
76767676767676767676767676767676767676767676767676767676767676767676767624762676767676767676767676767676767676767676767676767676
76767676767676767676767676767676763544444444444444444444444444444576767676767676767676767676767676767676767676767676767676767664
76247676767676767676767676767676767676767676767604767676767676767676760404040476767676767676767676767676767676767676767676343434
34343434343434343434343434343434343644444444444444444444444444444634343434343434343434343434343434343434343434343434343434343465
04040404040404040404047676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676040404
04040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404040404
14141414141414141414147676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676141414
14141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414
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
0000000000000000000400000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000001030000800010000000000000000000000003000000100000000000000000000005090000000080000003000000000000000000000000010000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
5167676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676762676767676767676767676767676767676767
6743436767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676743434367676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676743434343676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767434343434367676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767404142676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676745464767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6740414142676755566767676767676767676767404141426767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676765666767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
7767676767676775767753535353535353535367676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
4141414141414141414141414141414141414142676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
5151515151515151676767676767676767676752676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767674041426767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a52525252525252525252525252525252525252525252525252525252525252526a6a4848676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a52525252525252525252525252525252525252525252525252525252525252526a6a4848676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a52525252525252525252525252525252525252525252525252525252525252526a6a4848676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a52525252525252525252525252525252525252525252525252525252525252526a6a4848676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767676767
__sfx__
010a0000186142461330615000001861424613306133c615000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010702000065400651006510064100641006510063100641006410063100621006110062100611006110061500000000000000000000000000000000000000000000000000000000000000000000000000000000
011000001d7341d730217302173024730247302973029730297302973029730297302973029730297302973524000000000000000000000000000000000000000000000000000000000000000000000000000000
011000000000000000000000000000000000000e0140e0100e0100e0100e0100e0100e0100e0100e0100e01500000000000000000000000000000000000000000000000000000000000000000000000000000000
011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000001d7501d7501c7501c7501a7501a75019750167501575015750157501575015750157501575015750187001870018700187001870018700187000c7000c7000c7000c7000c7000c7000c7000070000700
011000000000000000000000000000000000000000000000097220972209722097220972209722097220972200002000000000000000000000000000000000000000000000000000000000000000000000000000
011000000000000000000000000000000000000000000000045220452204522045220452204522045220452200000000000000000000000000000000000000000000000000000000000000000000000000000000
010800001c0441c0351c0041c0051c0041c0051c0041c005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01100000137300c7000c7000c70013730000000000000000137300c7000c7000c70013730000000000000000137300c7000c7000c70013730000000000000000137300c7000c7000c700137300c7000c70015740
01100000020300000000000000000203000000000000000002030000000000000000020300000000000000000203000000000000000002030000000000000000020300000000000000000203000000000000e020
011000000b7140b7100b7100b7100b7100b7100b7100b710100101001010010100101001010010100101001009010090100901009010090100901009010090100c0100c0100c0100c0100c0130c0140c0130c013
011000000000000000000000000000000000000000000000000000000000000000001c6251c6251c6251c6250000000000000000000000000000000000000000000000000000000000001c6351c6251c6251c635
011000001d7341d7301d7301f73020730207302073020730007000070000700007000070000700007000070025730257302573025730247302473024730247350070000700007000000000000000000000000000
011000001d7341d7301d7301f73020730207302073020730007000070000700000000000000700257242573027730277302773027730227302273022730227302473024730247302473500700007000000000000
011000000b0100b0100b0100b0100b0100b0100b0100b010100101001010010100101001010010100101001009010090100901009010090100901009010090100c0100c0100c0100c0100c0140c0140c0130c013
011000001d7141d7101d7101d7101d7101d7101d7101d7101d7101d7101d7101d7101d7101d7101d7101d7101f7101f7101f7101f7101f7101f7101f7101f7101f7101f7101f7101f7101f7101f7101f7101f715
011000000e0140e0100e0100e0100e0100e0100e0100e0100e0100e0100e0100e0100c0000c00000000000000e0100e0100e0100e0100e0100e0100e0100e0100e0100e0100e0100e01000000000000000000000
011000001d5350000500005000051f53500005000050000521535000051f535000051d5350000513535000051d53500005000050000521535005050050500505245350050521535005051d5351a5351853500505
011000001a5350050500505005051d5350050500505005051d5350050521535005051d535005051a5350050521535005050050500505245350050500505005052853500505265350050524535215351d53500505
011000001c7101c7101c7101c7101c7101c7101c7101c7101c7101c7101c7101c7101c7101c7101c7101c71021710217102171021710217102171021710217102171021710217102171021710217102171021715
011000000c0100c0100c0100c0100c0100c0100c0100c0100c0100c0100c0100c010000000000000000000000e0100e0100e0100e0100e0100e0100e0100e0100e0100e0100e0100e01000000000000000000000
__music__
04 41014344
44 0203044f
40 004b4444
43 4b444474
44 05060744
44 08444444
41 090a4b0c
40 090a0d0c
42 090a0e0c
41 0b444444
43 0f444444
41 10111244
42 14151364
44 44444444
54 45454545
40 44444444
40 54545454
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

