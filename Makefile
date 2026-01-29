BIN="./bin"
SRC=$(shell find . -name "*.go")

ifeq (, $(shell which $(BIN)/golangci-lint))
$(warning "could not find golangci-lint in $(PATH), run: curl -sfL https://golangci-lint.run/install.sh | sh")
endif

.PHONY: migrate-new migrate-up migrate-down lint

migrate-new:
	migrate create -ext sql -dir db/migrations -seq template

migrate-up:
	migrate --path db/migrations --database 'postgresql://root:password@localhost:5432/kadou?sslmode=disable' -verbose up

migrate-down:
	migrate --path db/migrations --database 'postgresql://root:password@localhost:5432/kadou?sslmode=disable' -verbose down

lint:
	$(info ******************** running lint tools ********************)
	$(BIN)/golangci-lint run -v
	