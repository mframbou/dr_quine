from os import system

get_right_i = lambda i: 5 if __file__ == "Sully.py" else i-1

i = 5;
if i <= 0: exit(0)
filename = "Sully_%d.py" % get_right_i(i)
cmd = "python3 Sully_%d.py" % get_right_i(i)
with open(filename, "w") as f:
    s = "from os import system{0}{0}get_right_i = lambda i: 5 if __file__ == {1}Sully.py{1} else i-1{0}{0}i = {3};{0}if i <= 0: exit(0){0}filename = {1}Sully_%d.py{1} % get_right_i(i){0}cmd = {1}python3 Sully_%d.py{1} % get_right_i(i){0}with open(filename, {1}w{1}) as f:{0}    s = {1}{2}{1}{0}    f.write(s.format((chr(10)), chr(34), s, get_right_i(i))){0}system(cmd){0}"
    f.write(s.format((chr(10)), chr(34), s, get_right_i(i)))
system(cmd)
