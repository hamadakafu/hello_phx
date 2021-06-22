user-create:
  curl-detail -XPOST -H "content-type: application/json" -d '{"email": "kafu.h1998@gmail.com"}' -u hello:secret localhost:4000/api/users                            ✘ 130

user-delete:
  curl-detail -XDELETE -u hello:secret localhost:4000/api/users/acad24cd-57e8-46b6-9d16-67b100f14929

text-create:
  curl-detail -XPOST -H "content-type: application/json" -d '{"value": "hoge"}' -u hello:secret localhost:4000/api/users/ef0b0e6a-94cf-4c4c-b9f1-8ec3be7f56cc/texts

text-delete:
  curl-detail -XDELETE -H "content-type: application/json" -u hello:secret localhost:4000/api/users/8a5fd075-daf7-429b-901b-aa7c062cb737
