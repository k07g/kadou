BIN="./bin"
SRC=$(shell find . -name "*.go")

.PHONY: migrate-new

migrate-new:
	migrate create -ext sql -dir db/migrations -seq template