#!/bin/bash
#if you use a proxy
#export RSYNC_PROXY=192.168.1.200:8080

RSYNC="rsync -rtlH --delete --delete-after"
REMOTE_URL="rsync://us.archive.ubuntu.com/ubuntu"
MIRROR_DIR="/var/spool/apt-mirror/mirror/us.archive.ubuntu.com/ubuntu"

dists=(xenial xenial-security xenial-updates bionic bionic-security bionic-updates)

for dist in "${dists[@]}"
do
  ${RSYNC} ${REMOTE_URL}/dists/${dist}/main/i18n/ ${MIRROR_DIR}/dists/${dist}/main/i18n/
  ${RSYNC} ${REMOTE_URL}/dists/${dist}/multiverse/i18n/ ${MIRROR_DIR}/dists/${dist}/multiverse/i18n/
  ${RSYNC} ${REMOTE_URL}/dists/${dist}/restricted/i18n/ ${MIRROR_DIR}/dists/${dist}/restricted/i18n/
  ${RSYNC} ${REMOTE_URL}/dists/${dist}/universe/i18n/ ${MIRROR_DIR}/dists/${dist}/universe/i18n/
done
