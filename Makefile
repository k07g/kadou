BIN="./bin"
SRC=$(shell find . -name "*.go")

.PHONY: migrate-new migrate-up migrate-down

migrate-new:
	migrate create -ext sql -dir db/migrations -seq template

migrate-up:
	migrate --path db/migrations --database 'postgresql://root:password@localhost:5432/kadou?sslmode=disable' -verbose up

migrate-down:
	migrate --path db/migrations --database 'postgresql://root:password@localhost:5432/kadou?sslmode=disable' -verbose down
