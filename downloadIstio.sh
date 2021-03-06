#!/bin/bash
# Temporary place holder that gets the job done.
# We can do arbitrary things in this script over time.
# This file will be fetched as: curl -L https://git.io/getIstio | sh -
# The script fetches the latest Istio release and untars it.

# TODO: Automate me.
ISTIO_VERSION="0.1.5"

NAME="istio-$ISTIO_VERSION"
OS="$(uname)"
if [[ "$OS" == "Darwin" ]] ; then
  OSEXT="osx"
else
  # TODO we should check more/complain if not likely to work, etc...
  OSEXT="linux"
fi
URL="https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-${OSEXT}.tar.gz"
echo "Downloading $NAME from $URL ..."
curl -L "$URL" | tar xz
# TODO: change this so the version is in the tgz/directory name (users trying multiple versions)
echo "Downloaded into $NAME:"
ls $NAME
BINDIR="$(cd $NAME/bin; pwd)"
echo "Add $BINDIR to your path; e.g copy paste in your shell and/or ~/.profile:"
echo "export PATH=\"\$PATH:$BINDIR\""
