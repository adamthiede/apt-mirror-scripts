#!/bin/bash
#only if you use a proxy
#export RSYNC_PROXY=192.168.1.200:8080

RSYNC="rsync -rtlH --delete --delete-after"
REMOTE_URL="rsync://us.archive.ubuntu.com/ubuntu"
MIRROR_DIR="/var/spool/apt-mirror/mirror/us.archive.ubuntu.com/ubuntu"

dists=(xenial bionic)

for dist in "${dists[@]}"
do
  if [ -d ${MIRROR_DIR}/dists/${dist}-updates/main/dist-upgrader-all ];then
    ls ${MIRROR_DIR}/dists/${dist}-updates/main/dist-upgrader-all
  else
    mkdir ${MIRROR_DIR}/dists/${dist}-updates/main/dist-upgrader-all
  fi

  if [ -d ${MIRROR_DIR}/dists/${dist}-updates/main/dist-upgrader-all/current ];then
        ls ${MIRROR_DIR}/dists/${dist}-updates/main/dist-upgrader-all/current
  else
        mkdir ${MIRROR_DIR}/dists/${dist}-updates/main/dist-upgrader-all/current
  fi

  ${RSYNC} ${REMOTE_URL}/dists/${dist}-updates/main/dist-upgrader-all/current/${dist}.tar.gz ${MIRROR_DIR}/dists/${dist}-updates/main/dist-upgrader-all/current/
  ${RSYNC} ${REMOTE_URL}/dists/${dist}-updates/main/dist-upgrader-all/current/${dist}.tar.gz.gpg ${MIRROR_DIR}/dists/${dist}-updates/main/dist-upgrader-all/current/
  ${RSYNC} ${REMOTE_URL}/dists/${dist}-updates/main/dist-upgrader-all/current/ReleaseAnnouncement ${MIRROR_DIR}/dists/${dist}-updates/main/dist-upgrader-all/current/
  ${RSYNC} ${REMOTE_URL}/dists/${dist}-updates/main/dist-upgrader-all/current/ReleaseAnnouncement.html ${MIRROR_DIR}/dists/${dist}-updates/main/dist-upgrader-all/current/
done
