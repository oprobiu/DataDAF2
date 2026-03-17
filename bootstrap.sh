#!/usr/bin/env bash
set -e
CONFIG="data/deck.json"
REPO=$(python3 -c "import json; print(json.load(open('$CONFIG'))['tools_repo'])")
VERSION=$(python3 -c "import json; print(json.load(open('$CONFIG'))['tools_version'])")
DEST=".tools/AFAS"

if [ -d "$DEST" ] && [ -f "$DEST/.version" ] && [ "$(cat $DEST/.version)" = "$VERSION" ]; then
    echo "Tools $VERSION already present."
    exit 0
fi

echo "Downloading AFAS $VERSION..."
rm -rf "$DEST"
mkdir -p .tools
git clone --depth 1 --branch "$VERSION" "https://github.com/$REPO.git" "$DEST"
echo "$VERSION" > "$DEST/.version"
echo "Done."
