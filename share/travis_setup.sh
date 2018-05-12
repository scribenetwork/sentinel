#!/bin/bash
set -evx

mkdir ~/.scribecore

# safety check
if [ ! -f ~/.scribecore/.scribe.conf ]; then
  cp share/scribe.conf.example ~/.scribecore/scribe.conf
fi
