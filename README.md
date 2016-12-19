## Credits

Some parts are taken from
* https://github.com/kylemanna/docker-openvpn (great server side OpenVPN image)


## Usage

### Plain `docker run`
```
docker run -it -v ~/client.ovpn:/etc/openvpn/client.conf --cap-add=NET_ADMIN --rm tkaefer/openvpn-client-container
```

### `docker-compose`

next up, comming soon.
