#!/bin/bash

curl --include --request DELETE http://localhost:3000/drinks/13 \
  --header "Authorization: Token token=aed111c23eac56713522a162617ab624" \
