--This is a simple computercraft events logger. This is useful if you need to know what to listen for for an
--os.pullEvent(). I put this code together in 2 min, so it isn't the cleanest, and I'm sure there's lots of room for
--improvement - Any suggestions are greatly appriciated! Happy Computing!
-X
size = {term.getSize()}
function line()
	print("")
	print("\b\b\b")
	for i=1,size[1],1 do
		term.write("-")
	end
end
line()
while true do
	evnt = {os.pullEvent()}
		if evnt[4] == nil and evnt[3] == nil and evnt[2] == nil then
			print(evnt[1])
			line()
		elseif evnt[4] == nil and evnt[3] == nil then
			print(evnt[1])
			print(evnt[2])
			line()
		elseif evnt[4] == nil then
			print(evnt[1])
			print(evnt[2])
			print(evnt[3])
			line()
		else
			print(evnt[1])
			print(evnt[2])
			print(evnt[3])
			print(evnt[4])
			line()
		end
end
