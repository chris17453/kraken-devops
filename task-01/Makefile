
# to change versions update the ENV variable in dockerfile

#default version if no ENV Variable is set
ifeq ($(LITECOIN_VERSION),)
	LITECOIN_VERSION :=0.18.1
@echo "Defaulting to version:" $(LITECOIN_VERSION)
endif

# Global variables
litecoin_version=litecoin-$(LITECOIN_VERSION)
litecoin_url=https://download.litecoin.org/$(litecoin_version)/linux/
litecoin_app=$(litecoin_version)-x86_64-linux-gnu.tar.gz
litecoin_sig=$(litecoin_version)-linux-signatures.asc
litecoin_app_dir=/opt/$(litecoin_version)
# This is only if you want to manually download the gpg pub key (not used)
litecoin_gpg_key=https://pgp.mit.edu/pks/lookup?op=get&search=0xFE3348877809386C
docker_tar=$(litecoin_version).tar


# generate a human readable help output
help:
	
	@echo "Host commands:"
	@echo " install-grype  : install vulnerability scanner"
	@echo " build-docker   : build docker image and save as tar"
	@echo " scan           : scan image tar with grype pass = < medium"
	@echo " clean          : removes temop files"
	@echo " build          : build-docker scan clean"

	@echo "Container commands:"
	@echo " download       : download litecoin binary"
	@echo " verify         : validate download with gpg key/checksum"
	@echo " install        : download & verify "
	@echo " clean          : removes temp files"


# download litecoin binary and gpg signature
download:	
	# download  litecoin and gpg sig file
	curl -o $(litecoin_app) -SL  $(litecoin_url)$(litecoin_app)
	curl -o $(litecoin_sig) -SL  $(litecoin_url)$(litecoin_sig)
	
# verify downloaded litecoin binary via checksum
verify:
	gpg --refresh-keys
	# import litecoins GPG Pub Key (pulled key from official website)
	gpg --recv-key FE3348877809386C
	# verify the gpg sig file with pub key
	gpg  --verify $(litecoin_sig) 
	# verify the binary with the sum from the sig file
	grep `sha256sum $(litecoin_app)` $(litecoin_sig)

# download the litecoin app and validate it
install: download verify
	# create the app directory recursivly
	echo APP DIR: $(litecoin_app_dir)
	mkdir -p $(litecoin_app_dir)
	# untar in to the working directory
	tar -xf $(litecoin_app) 

# install the grypoe bin in your system dir (command ripped from official grype repo)
install-grype:
	# install the latest version to /usr/local/bin
	curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin

# build docker image and save as tar
build-docker:
	docker build -t chris17453/litecoin-$(litecoin_version):latest . 
	docker save chris17453/litecoin-$(litecoin_version):latest>$(docker_tar)

# scan the docker image
scan:
	grype $(docker_tar)

# cleanup generated files
clean:
	rm $(litecoin_sig) -f
	rm $(litecoin_app) -f
	rm $(docker_tar) -f

#build the docker image and clean up
build: build-docker scan clean
