import os

CHECKSUM=None
results=None
data=None

# get environment variables
if 'DATA' in os.environ:
    data   =os.environ['DATA']
if 'RESULTS' in os.environ:    
    results=os.environ['RESULTS']
if 'CHECKSUM' in os.environ:    
    CHECKSUM=os.environ['CHECKSUM']

# exit if vars arnt set
if None==CHECKSUM or None==results or None==data:
    print("Environment Variables not set")
    exit(1)




	
print("--- Rules ---")
print(" Replace ")
print(" - {casual name} -> Chris")
print(" - {full name} -> Charles Watkins")
print("  - only lines that do not start with a #")
print(" - Replace ( with '")
print(" - Replace ) with '")
print("")

# read the file, make sure handle is closed
try:
    with open(data, 'r') as data_file:
        content = data_file.read()

        print("--- Original ---")
        print(content)
        print(" ")


        print("--- Results ---")

        lines=content.split("\n")

        new_lines=[]
        # loop through lines
        for line in lines:
            # skip commented lines, not handeling comments on any position other than 0
            line=line.replace("(","'")
            line=line.replace(")","'")

            if len(line)>0 and line[0]=='#':
                new_lines.append(line)
                continue

            line=line.replace("{casual name}","Chris")
            line=line.replace("{full name}","Charles Watkins")
            new_lines.append(line)

        new_results="\n".join(new_lines)
        with open(results, 'w') as writer:
                writer.write(new_results)

        print(new_results)
        print(" ")
except Exception as ex:
    print("Something went wrong {0} ".format(ex))
    exit(1)