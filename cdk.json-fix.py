import os

system = ""
data = ""

while True:
    system = input("Please type wither Windows or Unix based on what operating system this computer is running\nMac and Linux users typically answer Unix to this question: ").lower()
    if system == "windows" or system == "unix":
        break
    print("Select one of the two options!") # this statement is the reason I use an infinite while loop as opposed to putting the verification as the loop condition

# read+ mode treats write() as append
try:
    json = open("cdk.json", "r")
    data = json.read()
    json.close()
except FileNotFoundError:
    print("\nCould not find cdk.json in this folder\nThis workspace is not considered a CDK workspace without the cdk.json file\n")
    exit(2)

# make the appropriate replacement
if system == "unix":
    data = data.replace("python app.py", "python3 app.py")
elif system == "windows":
    data = data.replace("python3 app.py", "python app.py")

# write mode treats write() as overwrite
with open("cdk.json", "w") as json:
    json.write(data)
