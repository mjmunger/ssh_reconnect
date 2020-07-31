# ssh_reconnect

## Why?

Reconnecting to a rebooting server is the longest, anxiety filled minutes of your life. Why bother watching the ping? Just `reconnect.sh`. It will continuously ping for you, and when the host is up, attempt to connect.

## Quickstart

Clone the repo, and symlink to `/usr/local/bin`.

```
sudo su
cd /usr/src/
git clone https://github.com/mjmunger/ssh_reconnect.git
cd ssh_reconnect
ln -s reconnect.sh /usr/local/bin/reconnect
```

## Usage

reconnect [host]

## Support and issues
For support, problems, and issues, [file an issue on github](https://github.com/mjmunger/ssh_reconnect)