proto:
	protoc pkg/pb/*.proto --go_out=. --go_opt=paths=source_relative \
		--go-grpc_out=. --go-grpc_opt=paths=source_relative,require_unimplemented_servers=false

server:
	go run cmd/main.go
