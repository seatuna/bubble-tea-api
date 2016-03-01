#!/bin/bash

curl --include --request PATCH http://localhost:3000/drinks/1 \
  --header "Authorization: Token token=a96127859cc89e0360c1c64b19048383" \
  --header "Content-Type: application/json" \
  --data '{
    "drinks": {
      "name": "Taro",
      "ingredients": "Taro",
      "toppings": "Tapioca pearls and more!",
      "notes": "Taro is a root veggie",
      "store_id": "1"
    }
  }'
