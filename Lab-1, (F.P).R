# Name: Farees Patel
#Lab-1 (Boolean Logic)

#Task-1

#1
#Following is the boolean AND functions at work
# *Following is the boolean OR functions at work
# *OR operation holds false only when both operands are 0* # 

0 | 0 # Operand 0 OR operand 0 is False
1 | 0 # Operand 1 OR operand 0 is True
0 | 1 # Operand 0 OR operand 1 is True
1 | 1 # Operand 1 OR operand 1 is True

#3AND operation holds true only when both operands are 1* # 

0 & 0 # Operand 0 AND operand 0 is False
1 & 0 # Operand 1 AND operand 0 is False
0 & 1 # Operand 0 AND operand 1 is False
1 & 1 # Operand 1 AND operand 1 is True

#2
#
#Following is the boolean NOT functions at work
# *NOT operation switches the value of the operand* # 

!0 # NOT of Operand 0 is True
!1 # NOT of Operand 1 is False

#Task-2

#1
if(0 & 0) print("0 & 0 is False") else ("error somewhere") #Understanding AND operation using if statement 
if(0 & 1) print("0 & 1 is False") else ("error somewhere") #Understanding AND operation using if statement 
if(1 & 0) print("1 & 0 is False") else ("error somewhere") #Understanding AND operation using if statement 
if(1 & 1) print("1 & 1 is True") else ("error somewhere")  #Understanding AND operation using if statement 

#2
if(0 | 0) print("0 | 0 is False") else ("error somewhere") #Understanding OR operation using if statement
if(0 | 1) print("0 | 1 is True") else ("error somewhere") #Understanding OR operation using if statement
if(1 | 0) print("1 | 0 is True") else ("error somewhere") #Understanding OR operation using if statement
if(1 | 1) print("1 | 1 is True") else ("error somewhere") #Understanding OR operation using if statement

#3
if(!0) print("!0 is True") else ("error somewhere") #Understanding NOT operation using if statement
if(!1) print("!1 is False") else ("error somewhere") #Understanding NOT operation using if statement

#End of Lab-1