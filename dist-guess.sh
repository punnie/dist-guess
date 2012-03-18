#!/bin/bash

# The basis for this was stolen from a forum somewhere in the internet
# which location has been lost in the bottomless pit of time. A reference
# to the original author will be appended to this file as soon as I, or
# anyone knowlegeable, find the guy.

# The huge ifthenelse.
# Incomplete. The idea is to provide relevant info about the distro, such
# as its version or other data (e.g. Gentoo's baselayout version).

# Ubuntu
if [[ -r '/etc/lsb-release' ]]; then
    . /etc/lsb-release
    if [[ "$DISTRIB_DESCRIPTION" ]]; then
        n="$DISTRIB_DESCRIPTION"
    elif [[ "$DISTRIB_ID" ]]; then
        n="$DISTRIB_ID"
    fi

# ??
elif [[ -r '/etc/release' ]]; then
    n=`head -1 /etc/release | sed 's/ *\([[^0-9]]*\) [0-9].*/\1/'`

# Archlinux
elif [[ -r '/etc/arch-release' ]]; then
    n="Arch Linux"

# Debian
elif [[ -r '/etc/debian_version' ]]; then
    n='Debian'

# Gentoo
elif [[ -r '/etc/gentoo-release' ]]; then
    n=`head -1 /etc/gentoo-release`

# Knoppix
elif [[ -r '/etc/knoppix-version' ]]; then
    n='Knoppix'

# Mandrake
elif [[ -r '/etc/mandrake-release' ]]; then
    n='Mandrake'

# Pardus
elif [[ -r '/etc/pardus-release' ]]; then
    n='Pardus'

# Puppy Linux
elif [[ -r '/etc/puppyversion' ]]; then
    n='Puppy Linux'

# Redhat
elif [[ -r '/etc/redhat-release' ]]; then
    n='Red Hat'

# Sabayon Linux
elif [[ -r '/etc/sabayon-release' ]]; then
    n='Sabayon'

# Slackware
elif [[ -r '/etc/slackware-version' ]]; then
    n='Slackware'

# SuSE Linux
elif [[ -r '/etc/SuSE-release' ]]; then
    n='SuSE'

# Xandros
elif [[ -r '/etc/xandros-desktop-version' ]]; then
    n='Xandros'

# Zenwalk
elif [[ -r '/etc/zenwalk-version' ]]; then
    n="Zenwalk"
fi

[[ "${n:-}" = '' ]] &&  \echo "Could not determine the distro name." >&2 && \exit 1

echo $n
