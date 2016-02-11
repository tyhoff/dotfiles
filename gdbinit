# reboot bb2
define mr
mon reset
end

# reboot bb2
define mrh
mon reset halt
end

# print structures with one member on each line
set print pretty on

set pagination off

# save history and save to file
set history save on
set history size 10000
set history filename ~/.gdb_history

# Martijn Bluetooth memory dump
define xxd
dump binary memory /tmp/dump.bin $arg0 $arg0+$arg1
shell xxd /tmp/dump.bin
end

# Print backtrace of all threads
define btall
thread apply all backtrace
end
