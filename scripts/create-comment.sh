curl --include --request POST http://localhost:3000/drinks/2/comments \
  --header "Authorization: Token token=d9355d306c8ca9848454e390772c7a52" \
  --header "Content-Type: application/json" \
  --data '{
    "comments": {
      "comment": "Hate it i wonder maybe it has to do with length"
    }
  }'
