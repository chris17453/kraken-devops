
# Global variables
\checksum=md5.txt
data=data.txt
results=data_results.txt
casual_name=Chris
full_name=Charles Watkins


# generate a human readable help output
help:
	@echo "Command:"
	@echo " sed  : manipulate text template to generate a console and data output with a md5 sum for data"


# text munging /  sed & tr example 
# display rules
# display original text
# dislay munged text
# create md5 checksum of manipulated results 
sed:
	cat $(data) | sed "/^[^#]/s/{casual name}/$(casual_name)/g" | tr "(" "'"|tr ")" "'"|sed  "/^[^#]/s/{full name}/$(full_name)/g">$(results)
	
	@echo "--- Rules ---"
	@echo " Replace "
	@echo " - {casual name} -> Chris"
	@echo " - {full name} -> Charles Watkins"
	@echo "  - only lines that do not start with a #"
	@echo " - Replace ( with '"
	@echo " - Replace ) with '"
	@echo ""

	@echo "--- Original ---"
	@cat $(data)
	@echo " "
	
	@echo "--- Results ---"
	@cat $(results)
	@echo " "

	cat $(results)|md5sum>$(checksum)




	