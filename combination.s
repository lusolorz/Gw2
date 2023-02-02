        lw          0       1       n
        lw          0       2       r
        lw          0       6       NegOne       Stores negative one in r6
        lw          0       4       Caddr        load combination function address
        jalr        4       7                    call function
        halt
comb    beq         2       Zero    retone       If r == 0: return 1
        beq         1       2       retone       If n == r: return 1
        add         1       6       1            n - 1
                
retone  lw          0       3       One         Returns Value 1



// Memory
n       .fill       7
r       .fill       3
Zero    .fill       0
One     .fill       1
NegOne  .fill       -1
Caddr   .fill       <start_of_function>
<Your function data here>
Stack   .fill       0

// Registers
r0  value 0
r1  n input to function - ENFORCED
r2  r input to function - ENFORCED
r3  return value of function - ENFORCED
r4  local variable for function
r5  stack pointer
r6  temporary value (can hold different values at different times,
e.g., +1, -1, function address)
r7  return address - ENFORCED

int combination(int n, int r)
{
	  if (r==0 || n==r) {
    		return 1;
	  } else { 
    		return combination(n-1,r) + combination(n-1,r-1);
}
}

n, r
4, 2

Result: 6

Comination(n=4, r=2)
return combination(n=3, r=2) + combination(n=3, r=1)


| combination(n=3, r=2)
| return combination(n=2, r=2) + combination(n=2, r=1) // Equals 1 + combination(n=2, r=1)
| return 1 + combination(n=2, r=1)

|| combination(n=2, r=1)
|| return combination(n=1, r=1) + combination(n=1, r=0) // Equals 1 + 1
returns 2

returns 3


| combination(n=3, r=1)
| return combination(n=2, r=1) + combination(n=2, r=0) // Equals combination(n=2, r=1) + 1
returns 3

|| combination(n=2, r=1)
|| return combination(n=1, r=1) + combination(n=1, r=0) // Equals 1 + 1
returns 2
