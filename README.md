# apt-mirror-scripts
Ubuntu/Debian apt repository mirror scripts

I am worried about the longevity of [this blog post](http://blog.ef.net/2012/10/26/unbutu-release-upgrade-with-local-apt-mirror.html) so I am documenting it here and preserving the scripts (especially my own custom variants) in a slightly easier-to-digest and more recent format. Again, this is primarily just for me, not for general purpose usage.

## So You Want To Set Up An apt Mirror
Reasons to do this:
 - You have many servers not connected to the Internet that need to get new/updated packages
 - You have an always-on server with a lot of disk space, and a poor Internet connection speed
 - You want to contribute, and this is a publicly-accessible mirror

apt repository servers serve a specialized purpose for very specific infrastructure types, and you probably don't need to do this. That being said, this is something I need.

## What to do
Set up a separate /var partition or disk that's at least 500GB.

`sudo apt install apt-mirror`
Copy the scripts in this repo to /var/spool/apt-mirror/var/
Replace the default /etc/apt/mirror.list with the included mirror.list from this repo
Optional: edit the `set nthreads` option in the mirror.list to match roughly double your amount of cores. I've found I get serious corruption on the downloads if I set it to more than that.
Should be pretty simple. I mostly keep defaults.

run `apt-mirror &` as root and watch it fly. Run `df -h /var` (or /tmp or /apt-mirror or wherever you set it up) to keep an eye on your disk space.
