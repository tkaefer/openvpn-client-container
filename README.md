## Credits

Some parts are taken from
* https://github.com/kylemanna/docker-openvpn (great server side OpenVPN image)


## Usage

### Plain `docker run`
```
docker run -it -v ~/client.ovpn:/etc/openvpn/client.conf -e USER_KEY="$(cat ~/id_rsa.pub)" --cap-add=NET_ADMIN --rm tkaefer/openvpn-client-container
```

### `docker-compose`

Get the `docker-compose.yaml` [file from the github repo](https://github.com/tkaefer/openvpn-client-container/blob/master/docker-compose.yaml).
Copy it to an appropriate directory and run `docker-compose up -d` within that directory.

Watch the logs via `docker-compose logs -f`.
