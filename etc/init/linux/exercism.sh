#!/bin/bash

echo "install exercism"

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

# Load vital library that is most important and
# constructed with many minimal functions
# For more information, see etc/README.md
. "$DOTPATH"/etc/lib/vital.sh

wget https://github.com/exercism/cli/releases/download/v2.3.0/exercism-linux-64bit.tgz
tar -xzvf exercism-linux-64bit.tgz 
mv ./exercism ~/bin/
rm ./exercism-linux-64bit.tgz 
