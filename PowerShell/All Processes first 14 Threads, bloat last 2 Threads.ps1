if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$instances = Get-Process
foreach ($i in $instances) { $i.ProcessorAffinity=16383 }


ForEach($bloat1 in GET-PROCESS "Spotify") { $bloat1.ProcessorAffinity=49152}
ForEach($bloat2 in GET-PROCESS "SandboxiCrypto") { $bloat2.ProcessorAffinity=49152}
ForEach($bloat3 in GET-PROCESS "SandboxieDcomLaunch") { $bloat3.ProcessorAffinity=49152}
ForEach($bloat4 in GET-PROCESS "SandboxieRpcSs") { $bloat4.ProcessorAffinity=49152}
ForEach($bloat5 in GET-PROCESS "SbieCtrl") { $bloat5.ProcessorAffinity=49152}
ForEach($bloat6 in GET-PROCESS "SbieSvc") { $bloat6.ProcessorAffinity=49152}


# ForEach($bloat7 in GET-PROCESS "Discord") { $bloat7.ProcessorAffinity=49152}
