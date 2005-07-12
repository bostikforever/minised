# TODO: minised fails to parse if the group below is in onw line
/b/ { s/b\+/y/g 
      t end
    }
s/a*/x/g
:end
