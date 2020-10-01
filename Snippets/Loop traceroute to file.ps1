Foreach ($host in (Get-Content -Path .\ip-addresses.txt) {
   Tracert -h 5 $host | Out-File -FilePath tracert.txt -Append
}