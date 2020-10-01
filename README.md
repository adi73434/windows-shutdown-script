# windows-shutdown-script
Windows Batch script for some minor, and rather useless, utility

Current "Features":
- A "semi-not-really" useful back/quit/cnfrm "UX" feature for every interaction
- Sample affinity targetting for a process
- Placeholder PowerShell affinity scripts called
- Power options
- Toggle power plans, doesn't auto-detect plans yet
- Kill/restart process
- Start CMD as System (PSTools)
- Clear event logs
- Spin down drives (HDDScan)


Todo Features:
- Ping to file and console
- Manual affinity allocation. Calculate from binary cores to hex and apply to given process
- Premade "gaming" affinity allocation. Frees up most cores depending on core and thread count
- Windows debloat
- Windows "setup" config. Automate some stuff that I do when I get a fresh Windows install
