We use this to connect our HASS system to another server in the cloud so we can reverse proxy to HASS.

You must start from a tar file containing all the files needed for OpenVPN configuration. It must include a valid .ovpn file and certificate files.

Plugin addon looks like this
```
{
  "archive": "base64 archive data"
}
```
You can convert any file to base64 running `$ cat file.tar.gz | base64 -w 0`
