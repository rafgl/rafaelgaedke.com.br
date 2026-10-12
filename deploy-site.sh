#!/bin/sh
# Deploys the static site in site/ to Firebase Hosting (project rafaelgaedke-725dc).
set -e
cd "$(dirname "$0")"
firebase deploy --only hosting
