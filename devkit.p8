pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
t = "> "

function _init()
	poke(0x5f2d, 1) -- activate devkit
end

function _draw()
	cls()
	print("⧗ "..flr(time()), 0, 0)
	print("cpu: "..(stat(1)*100).."%",0,10)
	print("ram: "..(stat(0)).."k",0,20)
	print(t,0,64)
	print("type something...", 0, 64-10)

	spr(1, stat(32), stat(33))
end

function _update60()
	if stat(30) then
		t = t..stat(31)
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000700070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
