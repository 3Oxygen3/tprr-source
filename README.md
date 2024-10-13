press J to toggle tape farming

press X to close script

source.lua can be used if you want a key system (for some reason lol) just make anything past line 1 a loadstring for example:

```lua
--Replace KEY with the correct key
getgenv().userInputKey = "KEY"
loadstring(game:HttpGet("https://raw.githubusercontent.com/3Oxygen3/TPRR-Script/main/Farm.lua"))()
```
