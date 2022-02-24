from math import log, e, cos, sin


s = input()
p = s[:2]
x = float(input())
if p == 'x^':
    r = int(s[2:]) * x ** (int(s[2:]) - 1)
elif '^' in s:
    r = int(s[:s.find('^')]) ** x * log(int(s[:s.find('^')]), e)
elif p == 'ln':
    r = 1 / x
elif p == 'tg':
    r = 1 / cos(x) ** 2
else:
    r = - 1 / sin(x) ** 2
if r == int(r):
    print(round(r, 3))
