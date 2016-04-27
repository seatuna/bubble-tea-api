curl --include --request PATCH http://localhost:3000/comments/13 \
  --header "Authorization: Token token=d9355d306c8ca9848454e390772c7a52" \
  --header "Content-Type: application/json" \
  --data '{
    "comments": {
      "comment": "Test tea"
    }
  }'
