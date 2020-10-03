# windows-shutdown-script
Windows Batch script for some minor, and rather useless, utility

## Current "Features":
- A "semi-not-really" useful back/quit/cnfrm "UX" feature for every interaction
- Sample affinity targetting for a process
- Placeholder PowerShell affinity scripts called
- Power options
- Toggle power plans, doesn't auto-detect plans yet
- Kill/restart process
- Start CMD as System (PSTools)
- Clear event logs
- Spin down drives (HDDScan)
- Ping to file and console

## Todo Features:
- Manual affinity allocation. Calculate from binary cores to hex and apply to given process
- Premade "gaming" affinity allocation. Frees up most cores depending on core and thread count
- Windows "setup" function. Automate most of the stuff I do when I get a new Windows 10 install
- Windows debloat function. Only touches Windows in ways that "remove" stuff

## I want to rewrite to C#/C++
- I would like to convert this to a C# or C++ project. Preferring the latter for my own amusement and to either keep the size down or learn GUI, but the former might be more applicable since "using Microsoft's thing for Microsoft's OS" feels most suitable.
- A GUI would be nice. With C++ I could use (and learn) Sciter, but I'd like to learn Qt/wxWidgets.
- I want a language that doesn't feel like I'm writing on a whiteboard -- smudging over everything, only being able to draw simple arrows of "do this now" instead of using actual functions, and being impossible to expand functionality without making a mess in one file.
- Why KISS when you can C++

## Maybe Python?
- All the hip
- Actually flexible and quick to write
- Makes actual sense
- Haven't researched GUIs
- Suited to scripting

## C#/C++ plan
- GUI
- Write the code with the presumption that I will copypasta it into something else
- Start another GUI project which will have all of the small apps I want to write (Discord JPEG compression, calculator, unit conversion) and not just "system" operations
- Archive this
