source ~/.gdbinit.other

# -- GDBUNDLE_EDITS_BEGIN
python

import os,subprocess,sys
# Execute a Python using the user's shell and pull out the sys.path (for site-packages)
paths = subprocess.check_output('python -c "import os,sys;print(os.linesep.join(sys.path).strip())"',shell=True).decode("utf-8").split()
# Extend the current GDB instance's Python paths
sys.path.extend(paths)

end
# -- GDBUNDLE_EDITS_END


# print structures with one member on each line
set print pretty on

set pagination off

set python print-stack full

# save history and save to file
set history save on
set history size 10000
set history filename ~/.gdb_history



# Martijn Bluetooth memory dump
define xxd
  dump binary memory /tmp/dump.bin $arg0 ((char *)$arg0)+$arg1
  shell xxd /tmp/dump.bin
end
document xxd
  Runs xxd on the memory 

  xxd ADDR LENTH
end

# offsetof
macro define offsetof(t, f) &((t *) 0)->f
