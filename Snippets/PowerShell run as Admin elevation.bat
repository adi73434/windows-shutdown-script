@echo off

set scriptFileName=asd
set scriptFolderPath=E:\Productivity NVMe\__Git\CMDandPowerShell\windows-shutdown-script
set powershellScriptFileName=%scriptFileName%.ps1

powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -NoExit -Command `\"cd \`\"%scriptFolderPath%\`\"; & \`\".\%powershellScriptFileName%\`\"`\"\" -Verb RunAs"
