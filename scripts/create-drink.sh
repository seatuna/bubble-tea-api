#!/bin/bash

curl --include --request POST http://localhost:3000/stores/1/drinks \
  --header "Authorization: Token token=39f0cf7aa941e5beba2c4a036fdab036" \
  --header "Content-Type: application/json" \
  --data '{
    "drinks": {
      "name": "Test",
      "ingredients": "Taro powder, milk, green tea",
      "toppings": "Tapioca pearls",
      "notes": "Taro is a root veggie.",
      "store_id": "1"
    }
  }'
