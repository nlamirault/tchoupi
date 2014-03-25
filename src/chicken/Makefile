TARGET=tchoupi

# Hack to solve GNU/BSD Make inconsistency
# On BSD Make, the second assignment overrides the effect of the first.
# On GNU Make versions without the != operator, the first assignment
# works as expected, while the second assignment assigns to another
# variable named 'GITREV!' (including the bang).
# End result: On BSD and GNU Make, there's a variable named GITREV which
# contains the output of running git as below.
GITREV:=	$(shell git rev-parse --short=10 HEAD)
GITREV!=	git rev-parse --short=10 HEAD

TARBALL=$(TARGET)-source-$(GITREV).tar.gz

PREFIX?=/usr/opt

TEST_FILES=test/*.scm
TEST_RUNNER=run-tests.scm
SOURCE_FILES=src/*.scm $(TEST_FILES)
EXTRA_SOURCE_FILES=Makefile
TARBALL_FILES=$(SOURCE_FILES) $(EXTRA_SOURCE_FILES)

EGGS=json
OTHER_DEPLOY_FILES=

SO=.so

DEPLOY_PATH=$(PWD)/deploy
DEPLOY_CSC_OPTIONS="-C -Os -strip"

$(TARGET): $(SOURCE_FILES)
	csc $(TARGET).scm

all: $(SOURCE_FILES) $(TARGET)

check: $(SOURCE_FILES) $(TEST_RUNNER) $(TEST_FILES)
	csi -s $(TEST_RUNNER)

install: $(TARGET)
	install -m 755 $(TARGET) $(PREFIX)/bin

install-eggs:
	chicken-install -s $(EGGS)

deploy: $(SOURCE_FILES) deploy-eggs deploy-others
	mkdir -p $(DEPLOY_PATH)/$(TARGET)
	env CSC_OPTIONS=$(DEPLOY_CSC_OPTIONS) \
		csc -deploy -o $(DEPLOY_PATH)/$(TARGET) $(TARGET).scm

deploy-eggs:
	mkdir -p $(DEPLOY_PATH)/$(TARGET)
	for egg in $(EGGS); do \
		env CSC_OPTIONS=$(DEPLOY_CSC_OPTIONS) chicken-install -s \
			-prefix $(DEPLOY_PATH)/$(TARGET) -deploy $$egg; \
	done

deploy-others:
	mkdir -p $(DEPLOY_PATH)/$(TARGET)
	CR_PATH=$$(chicken-install -s -repository) && \
	for file in $(OTHER_DEPLOY_FILES); do \
		cp $$CR_PATH/$$file$(SO) $(DEPLOY_PATH)/$(TARGET) && \
		strip $(DEPLOY_PATH)/$(TARGET)/$$file$(SO); \
	done

clean:
	rm -f $(TARGET)
	rm -rf $(DEPLOY_PATH)

source-tarball:
	tar -czf $(TARBALL) $(TARBALL_FILES)

distclean: clean
	rm -f $(TARBALL)

print-eggs:
	@echo $(EGGS)
