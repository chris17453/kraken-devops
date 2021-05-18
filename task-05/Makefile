
checksum=md5.txt
data=data.txt
results=data_results.txt
casual_name=Chris
full_name=Charles Watkins


# generate a human readable help output
help:
	@echo "Commands:"
	@echo " py-munge  : generate a console,data output with a md5 sum for data"
	@echo " verify    : comnpare task-04-task-05 md5 sums for textual validation"
	
# text munging /  sed & tr example 
# set the data files as environment variables and run the pythoin script
# to generate the same script outouts as the task-04 script
# then generate a md5 checksum from this output and save it
py-munge:  
	@export DATA=$(data) ; \
	export CHECKSUM=$(checksum) ; \
	export RESULTS=$(results); \
	python ./py-munge.py
	@cat $(results)|md5sum>$(checksum)

# validate the checksums of the 2 different md5.txt files against each other. 
# anything other than an exact match fails
verify:
	@diff $(checksum) ../task-04/$(checksum)
	@echo "Output Good - MD5 Sums of task 04 - 05 match"





	