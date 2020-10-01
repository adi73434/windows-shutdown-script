for /f %%A in (ip-addresses.txt) do (
tracert  -h 5 %%A
) >> traceout.txt