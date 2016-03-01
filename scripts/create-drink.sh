#!/bin/bash

curl --include --request POST http://localhost:3000/stores/1/drinks \
  --header "Authorization: Token token=265da3d7f6f4d3dd7b439fc6b1e9ffb8" \
  --header "Content-Type: application/json" \
  --data '{
    "drinks": {
      "name": "Taro Milk Tea",
      "ingredients": "Taro powder, milk, green tea",
      "toppings": "Tapioca pearls",
      "notes": "Taro is a root veggie.",
      "store_id": "1"
    }
  }'
