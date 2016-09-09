# Disable prompting
define hook-add-symbol-file
set confirm off
end

# PBL-17248 set the charset to get around a libiconv bug
set charset US-ASCII
# fix up our python path first since GDB is likely linked with system (not brewed) python
source /Users/thoffman/dev/tintin/tools/gdb_scripts/gdb_python_path_fix.py
# source all tools
source /Users/thoffman/dev/tintin/tools/gdb_scripts/gdb_tintin.py
source /Users/thoffman/dev/tintin/tools/gdb_scripts/gdb_printers.py
source /Users/thoffman/dev/tintin/tools/gdb_scripts/gdb_tintin_bluetooth.py

# Enable prompting
define hookpost-add-symbol-file
set confirm on
end


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
