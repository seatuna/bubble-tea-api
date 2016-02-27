#!/bin/bash

curl --include --request POST http://localhost:3000/stores/:store_id/drinks \
  --header "Authorization: Token token=f1db76d1212437a43dd1fae030b4d39d" \
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
