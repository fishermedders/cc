--This program is By fishermedders @ http://fishermedders.github.io/ and is very Simple :P
--This code is for CraftOS 1.5+ as it was written in mimic. This can be found (http://gravlann.github.io/)
--This program is under MIT license which means that you can do whatever you want, just give me credit :)
--It is just in case for whatever reason you want to serialize an Image to get chars so you can load
--Images strait from a program and not have to shell.run("pastebin get <code> <name")
--This is just one way of doing this; use it if you would like ;)

--Starting Vars/Code
t = term
t.clear()
t.setCursorPos(1,1)

fs.delete("output") -- Deletes Previous output file if you have one

--Starting Code
t.write("Hello! What file would you like to Serialize?")
t.setCursorPos(1,2)
inp = read() -- Asks for user input and stores under the variable inp (a string)

if inp == "" then
	print("You must enter a file name! (Without \"\"")
	shell.exit()
else

--The Start of Serialization
table = paintutils.loadImage(inp)
table1 = textutils.serialize(table)

--Prints for viewers' viewing pleasure.
print(table1)

--Writes the serialized image to a file named "output"
op = fs.open("output","w")
op.write(table1) -- Writes table
op.close() -- Closes file

--Closing remarks
--Have a nice day!
---X
end
