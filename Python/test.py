exec(s:='print("exec(s:=%r)"%s)')


# s has the value 'print("exec(s:=%r)"%s)'
# then we execute s, so we do print("exec(s:={s})") ( {s} being the value of s)
# so this codes then executes > print("exec(s:='print("exec(s:=%r)"%s)'")
# which in prints 'exec(s:='print("exec(s:=%r)"%s)')'
# which is the same as the first line of the code