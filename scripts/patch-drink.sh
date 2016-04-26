#!/bin/bash

curl --include --request PATCH http://localhost:3000/drinks/1 \
  --header "Authorization: Token token=39f0cf7aa941e5beba2c4a036fdab036" \
  --header "Content-Type: application/json" \
  --data '{
    "drinks": {
      "name": "Test tea",
      "ingredients": "Taro",
      "toppings": "Tapioca pearls and more!",
      "notes": "Taro is a root veggie",
      "store_id": "1"
    }
  }'
