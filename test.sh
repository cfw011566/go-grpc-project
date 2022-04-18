# register a new user
curl --request POST \
  --url http://localhost:3000/auth/register \
  --header 'Content-Type: application/json' \
  --data '{
 "email": "elon@musk.com",
 "password": "1234567"
}'

# login
curl --request POST \
  --url http://localhost:3000/auth/login \
  --header 'Content-Type: application/json' \
  --data '{
 "email": "elon@musk.com",
 "password": "1234567"
}'

# create product
curl --request POST \
  --url http://localhost:3000/product/ \
  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTA1NTAwMTUsImlzcyI6ImdvLWdycGMtYXV0aC1zdmMiLCJJZCI6MSwiRW1haWwiOiJlbG9uQG11c2suY29tIn0.TDf_ecBgiqs8dsmhlDG3F-3eqIVoebn5NNvkZA21YHw' \
  --header 'Content-Type: application/json' \
  --data '{
 "name": "Product A",
 "stock": 5,
 "price": 15
}'

# find one product
curl --request GET \
  --url http://localhost:3000/product/1 \
  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTA1NTAwMTUsImlzcyI6ImdvLWdycGMtYXV0aC1zdmMiLCJJZCI6MSwiRW1haWwiOiJlbG9uQG11c2suY29tIn0.TDf_ecBgiqs8dsmhlDG3F-3eqIVoebn5NNvkZA21YHw'

# create order
curl --request POST \
  --url http://localhost:3000/order/ \
  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTA1NTAwMTUsImlzcyI6ImdvLWdycGMtYXV0aC1zdmMiLCJJZCI6MSwiRW1haWwiOiJlbG9uQG11c2suY29tIn0.TDf_ecBgiqs8dsmhlDG3F-3eqIVoebn5NNvkZA21YHw' \
  --header 'Content-Type: application/json' \
  --data '{
 "productId": 1,
 "quantity": 1
}'
