package main

import (
	"log"

	"example.com/go-grpc-api-gateway/pkg/auth"
	"example.com/go-grpc-api-gateway/pkg/config"
	"example.com/go-grpc-api-gateway/pkg/order"
	"example.com/go-grpc-api-gateway/pkg/product"
	"github.com/gin-gonic/gin"
)

func main() {
	c, err := config.LoadConfig()

	if err != nil {
		log.Fatalln("Failed at config", err)
		return
	}

	r := gin.Default()

	authSvc := *auth.RegisterRoutes(r, &c)
	product.RegisterRoutes(r, &c, &authSvc)
	order.RegisterRoutes(r, &c, &authSvc)

	r.Run(c.Port)
}
