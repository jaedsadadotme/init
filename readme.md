# Initial

### List
```sh
curl http://<username>:<password>@jaedsada.me/list?type=<type> | jq
```
type
- init
- dockerfile

### Init

```sh
$ curl https://<username>:<password>@jaedsada.me/init?title=<xxx> | sh
```

### Dockerfile

```sh
$ curl https://<username>:<password>@jaedsada.me/dockerfile\?title\=xxx | docker build -t <name> -f- .
```