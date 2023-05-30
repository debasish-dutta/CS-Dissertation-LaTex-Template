# random_script.py

import math
# initialize x and n with values
x = 4
n = 3
# approach 1
result_val = x ** n
print("%d raised to the power %d is %d" % (x,n,result_val))
# approach 2
result_val = pow(x,n)
print("%d raised to the power %d is %d" % (x,n,result_val))
# approach 3
result_val = math.pow(x,n)
print("%d raised to the power %d is %5.2f" % (x,n,result_val))