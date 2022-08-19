import os
import sys

data = ""
# read+ mode treats write() as append
try:
    json = open("cdk.json", "r")
    data = json.read()
    json.close()
except FileNotFoundError:
    print("\nCould not find cdk.json in this folder\nThis workspace is not considered a CDK workspace without the cdk.json file\n")
    exit(2)

# make the appropriate replacement
if sys.argv[1] == "unix":
    data = data.replace("python app.py", "python3 app.py")
elif sys.argv[1] == "windows":
    data = data.replace("python3 app.py", "python app.py")

# write mode treats write() as overwrite
with open("cdk.json", "w") as json:
    json.write(data)
