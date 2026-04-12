psd=input("Enter password: ")
score =0
if  len(psd) >= 8:
	score += 1
else:
	print("Password should be atleast 8 characters long")

if any(char.isupper() for char in psd):
	score+=1
else:
	print("It should have atleast one uppercase")

if any(char.islower() for char in psd):
        score+=1
else:
        print("It should have atleast one lowercase")

if any(char.isdigit() for char in psd):
        score+=1
else:
        print("It should have atleast one number")

if any(not char.isalnum() for char in psd):
        score+=1
else:
        print("It should atleast have one special character")


if score<=2:
	print("weak")
elif score <= 4:
	print("medium")
else:
	print("Strong")

