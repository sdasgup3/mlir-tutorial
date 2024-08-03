set -o errexit
set -o nounset
set -o pipefail

if [[ $# -ne 0 ]] ; then
  echo "Usage: $0"
  exit 1
fi

# Build and Test StableHLO
bazel build //...
bazel test //...
