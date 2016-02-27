#!/bin/bash

curl --include --request PUT http://localhost:3000/drinks/11 \
  --header "Authorization: Token token=f1db76d1212437a43dd1fae030b4d39d" \
  --header "Content-Type: application/json" \
  --data '{
    "drinks": {
      "name": "Taro Milk Tea+",
      "ingredients": "Taro powder, milk, green tea, water",
      "toppings": "Tapioca pearls and more!",
      "notes": "Taro is a root veggie, idk about powder",
      "store_id": "1"
    }
  }'
