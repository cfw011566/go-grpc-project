package main

import (
	"fmt"
	"log"
	"net"

	"example.com/go-grpc-order-svc/pkg/client"
	"example.com/go-grpc-order-svc/pkg/config"
	"example.com/go-grpc-order-svc/pkg/db"
	"example.com/go-grpc-order-svc/pkg/pb"
	"example.com/go-grpc-order-svc/pkg/services"
	"google.golang.org/grpc"
)

func main() {
	c, err := config.LoadConfig()

	if err != nil {
		log.Fatalln("Failed at config", err)
	}

	h := db.Init(c.DBUrl)

	lis, err := net.Listen("tcp", c.Port)

	if err != nil {
		log.Fatalln("Failed to listening:", err)
	}

	productSvc := client.InitProductServiceClient(c.ProductSvcUrl)

	if err != nil {
		log.Fatalln("Failed to listening:", err)
	}

	fmt.Println("Order Svc on", c.Port)

	s := services.Server{
		H:          h,
		ProductSvc: productSvc,
	}

	grpcServer := grpc.NewServer()

	pb.RegisterOrderServiceServer(grpcServer, &s)

	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalln("Failed to serve:", err)
	}
}
