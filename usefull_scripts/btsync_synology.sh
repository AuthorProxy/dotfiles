# You can find version for your device here:
# http://labs.bittorrent.com/experiments/sync.html
# Change /volume1/homes/btsync/ to /user/local/btsync
# If you don't have separate user for btsync
# Otherwise check create btsync user via DSM UI
# And change "/sbin/nologin" to "/bin/sh" at "/etc/passwd" btsync row

killall btsync
curl http://download-lb.utorrent.com/endpoint/btsync/os/linux-ppc-quoriq/track/stable | tar xzf - -C /volume1/homes/btsync/bin/ btsync

### Run this if you begin with clean installation
# mkdir -p /volume1/homes/btsync/bin/
# mkdir -p /volume1/homes/btsync/var/
# mkdir -p /volume1/homes/btsync/.sync/
# /volume1/homes/btsync/bin/btsync --dump-sample-config > /volume1/homes/btsync/var/sync.conf
# And change config settings:
# "device_name": "DSM213+",
# "storage_path" : "/volume1/homes/btsync/.sync",
# "pid_file" : "/volume1/homes/btsync/.sync/sync.pid",
# "webui" :
# {
#  "listen" : "0.0.0.0:8888",
#  "login" : "user",
#  "password" : "password"
# }

###

# Run process with our config file
/volume1/homes/btsync/bin/btsync --config /volume1/homes/btsync/var/sync.conf

# Edit /etc/rc.local to enable autorun btsync process
# /volume1/homes/btsync/bin/btsync --config /volume1/homes/btsync/var/sync.conf

# And add aliases to /root/.profiles
# alias btstart="/volume1/homes/btsync/bin/btsync --config /volume1/homes/btsync/var/sync.conf"
# alias btfind="ps aux | grep btsync"
# alias btkill="pkill btsync"

# Give all root access to btsync, not recommended
# su - root -c "/usr/local/sync/btsync --config /usr/local/sync/sync.conf"
# Also read this:
# http://vasilisc.com/btsync
# https://www.digitalocean.com/community/tutorials/how-to-use-bittorrent-sync-to-synchronize-directories-in-ubuntu-12-04
