os=${OSTYPE//[0-9.]/}

echo "Performing setup for $os"

. ./terminal/setup.sh
. ./vim/setup.sh
. ./zsh/setup.sh
. ./task/setup.sh
. ./go/setup.sh
