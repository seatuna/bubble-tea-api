#!/bin/bash

curl --include --request DELETE http://localhost:3000/drinks/13 \
  --header "Authorization: Token token=f1db76d1212437a43dd1fae030b4d39d" \
