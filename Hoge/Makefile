
# Makefileの存在するディレクトリ
MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

PROJECT_DIR := ${MAKEFILE_DIR}

TARGET := Hoge.ino
BUILD_PATH := ~/build/Hoge

include ${MAKEFILE_DIR}/../arduino-cli.mk
