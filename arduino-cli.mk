PROJECT_DIR ?= . 

TARGET ?= Template.ino
BUILD_PATH ?= Template/Path

BUILD_TYPE ?= Release

BUILD_FLAGS := 
EXTRA_BUILD_FLAGS ?=

BOARD_OPTIONS := CDCOnBoot=cdc
EXTRA_BOARD_OPTIONS ?=

ifeq (${BUILD_TYPE},Debug)
	EXTRA_BUILD_FLAGS += --optimize-for-debug
	EXTRA_BOARD_OPTIONS += DebugLevel=debug
endif

BUILD_FLAGS += ${EXTRA_BUILD_FLAGS}

BOARD_OPTIONS += ${EXTRA_BOARD_OPTIONS}

null  :=
space := $(null) #
comma := ,

BOARD_OPTIONS := $(subst $(space),$(comma),$(strip $(BOARD_OPTIONS)))

FQBN_BASE ?= esp32:esp32:esp32s3

FQBN := ${FQBN_BASE}:${BOARD_OPTIONS}

WARNING_LEVEL ?= default

addr2line ?= ~/.arduino15/packages/esp32/tools/esp-x32/2405/bin/xtensa-esp32s3-elf-addr2line

.PHONY: compile
compile:
	arduino-cli compile --build-path ${BUILD_PATH} ${BUILD_FLAGS} --warnings ${WARNING_LEVEL} --fqbn ${FQBN} -j0
	cp ${BUILD_PATH}/compile_commands.json ${PROJECT_DIR}

.PHONY: lsp
lsp:
	arduino-cli compile --build-path ${BUILD_PATH} --only-compilation-database -j0
	cp ${BUILD_PATH}/compile_commands.json ${PROJECT_DIR}

.PHONY: clean
clean:
	arduino-cli compile --clean --build-path ${BUILD_PATH} -j0

.PHONY: upload
upload:
	arduino-cli upload --build-path ${BUILD_PATH}

.PHONY: monitor
monitor:
	arduino-cli monitor

.PHONY: addr2line
addr2line:
	
