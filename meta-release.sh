#!/bin/bash

MIRROR_DIR="/var/spool/apt-mirror/mirror/us.archive.ubuntu.com/ubuntu"
WGET="wget -qc -O -"
#your remotely-resolveable IP here; usually not hostname -i but that's a placeholder
$IP=$(hostname -i)
${WGET} http://changelogs.ubuntu.com/meta-release | sed -e 's/archive.ubuntu.com/$IP/g' > ${MIRROR_DIR}/meta-release
${WGET} http://changelogs.ubuntu.com/meta-release-lts | sed -e 's/archive.ubuntu.com/$IP/g' > ${MIRROR_DIR}/meta-release-lts
