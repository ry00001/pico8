pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- pride flag drawer
-- (public domain) 2018 ry00001/hazel
-- made probably maybe for gssp but idk

data = {
	{flag={
		{s=1,p=-2},
		{s=2,p=-1},
		{s=3,p=0},
		{s=2,p=1},
		{s=1,p=2}},
		name="trans"
	},
	{flag={
		{s=4,p=-2},
		{s=4,p=-1},
		{s=4,p=0},
		{s=4,p=1},
		{s=4,p=2}
	},name="intersex",
	c=function() 
		for i=10,12 do
			circ(64,23,i,2)
		end
	end}
}
-- okay so this one is
-- a little confusing,
-- but basically
-- s is the sprite index
-- and p is the position
-- negative = higher
-- positive = lower
-- 0 = middle
-- you can draw anything
-- not just flags or colours

-- btw, c is a draw function
-- that gets called in
-- _draw()
-- if you wanna do custom
-- drawing over the flag
-- use it
-- example: the intersex flag

-- don't touch it
function calctext(txt)
	return -#txt*5
end

text=""
x = calctext(text)
index=1
infot = "push ⬅️➡️ to switch flags"
-- end don't touch it

function _draw()
	cls()
	print(text, x, 128-15, 6)
	print(infot, (64/2)-#infot*1.3, 128-5, 12)
	local j=data[index]
	local cf = j.flag
	for _,d in pairs(cf) do	
		for j=0,128,8 do
			spr(d.s, j, (d.p*8)+20)
		end
	end
	if	j.c then j.c() end
end

function _spd()
	if btn(4) then return 2.5 else return 0.5 end
end

function _update60()
	local spd = _spd()
	x = x+spd
	if x > 128 then
		x = calctext(text)
	end
	if (btnp(1)) index+=1
	if (btnp(0)) index-=1
	if index>#data or index<1 then
		index=1
	end
	text="current flag: "..data[index].name
end
__gfx__
00000000cccccccceeeeeeee77777777aaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccceeeeeeee77777777aaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccceeeeeeee77777777aaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccceeeeeeee77777777aaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccceeeeeeee77777777aaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccceeeeeeee77777777aaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccceeeeeeee77777777aaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccceeeeeeee77777777aaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
010100001a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001f630000301f630000301f630000301f630000301f630000301f630000301f630000301f630000301f630000301f630000301f630000301f630000301f630000301f630000301f630000301f63000030
001000001c1501c1501d1501d1501f1501f1501c1501c1501a1501f150231501f1501a1501f150231501f1501a1502315024150231501d1502315024150231501c1502115024150211501c150231501f1501a150
0010000023050180501805023050180501805023050180502305018050180502305018050180501805018050230501805018050230501805018050230501805018050210501f0501c050210501d0501c05018050
001000001d3501d3502135021350233502335021350213501f3501d3502335018350183501a3501c3501c350000001835018350000002135021350233501f3501d3501c350213501f350233501f3501d35024350
001100001d3500000021350000001d350003002313024130000000000021350000001c35021350000002413023130000000000000000000000000000000000000000000000000000000000000000000000000000
011000001d3550030500305003051c3550030500305003051a355003051535500305153551535515355153551a3551a3551a3551a3551d355003051c3551d3550030517355003050030500305003050030500305
__music__
00 02014344

