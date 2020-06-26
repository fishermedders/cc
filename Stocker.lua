--Functions

function fResetTerminal()
  term.clear()
  term.setCursorPos(1, 1)
end

function fGetConfig()
  if not fs.exists("items.tbl") then
    tFile = fs.open("items.tbl", "w")
    tFile.write("{}")
    tFile.close()
  end
  tFile = fs.open("items.tbl", "r")
  tConfig = textutils.unserialize(tFile.readAll())
  tFile.close()
end

function fSaveConfig()
  tFile = fs.open("items.tbl", "w")
  tFile.write(textutils.serialize(tConfig))
  tFile.close()
end

function fGetItemsFromName(sName)
  tAvailable = p.listAvailableItems()
  tReturn = {}
  for i = 1,#tAvailable do
    if tAvailable[i].isCraftable then
      tCurrentItem = {["name"]=tAvailable[i].name,["damage"]=tAvailable[i].damage}
      print(textutils.serialize(tCurrentItem))
      tCurrentItemObject = p.findItem(tCurrentItem)
      tMeta = tCurrentItemObject.getMetadata()
      if string.match(sName, string.lower(tMeta.displayName)) then
        table.insert(tReturn, tMeta)
      end
    end
  end
  return tReturn
end

--Main Loops

function fUserInput()
  fResetTerminal()
  print("AE2 Autocrafting Stock Program by Fisher")
  print("The Crafting daemon is running in the background of this terminal. This interface is simply to edit what is crafted.")
  print("")
  print("Type a command to start")
  print("1. list")
  print("2. add")
  print("3. remove")
  sInput = read()
  if sInput == "list" then
  end
  if sInput == "add" then
    print("Adding Item.")
    print("Type part of the name of the item.")
    sInput = read()
    tResults = fGetItemsFromName(sInput)
    for i = 1,#tResults do
      print(tResults[i].displayName)
    end
    read()
  end
end

function fCraftingDaemon()

end

--The Main loop

fGetConfig()
p = peripheral.wrap("right")
while true do
  parallel.waitForAll(fUserInput, fCraftingDaemon)
end
