# Scribe Sentinel
<p align="center">
<a href="https://travis-ci.org/scribenetwork/sentinel" alt="Build Status">
<img src="https://travis-ci.org/scribenetwork/sentinel.svg?branch=master"/>
</a>
<a href="http://discord.scribe.network" alt="Discord">
<img src="https://img.shields.io/discord/402827967111233546.svg"/>
  </a>
<a href="http://twitter.scribe.network" alt="Twitter">
<img src="https://img.shields.io/twitter/follow/scribenetwork.svg?style=social&label=Follow"/>
</a>
</p>
<p align="center">
  <a href="http://scribe.network">http://scribe.network</a> | <a href="http://explorer.scribe.network">Block Explorer</a> | <a href="http://ann.scribe.network">Announcement</a> | <a href="http://discord.scribe.network">Discord</a> | <a href="http://twitter.scribe.network">Twitter</a>
</p>

## About 
An all-powerful toolset & watchdog daemon for Scribe.

Sentinel is an autonomous agent for persisting, processing and automating Scribe V12.1 governance objects and tasks, and for expanded functions in the upcoming Scribe releases.

Sentinel is implemented as a Python application that binds to a local version 12.1 scribed instance on each Scribe Masternode.

This guide covers installing Sentinel onto an existing 12.1 Masternode in Ubuntu 14.04 / 16.04.

## Installation

### 1. Install Prerequisites

Make sure Python version 2.7.x or above is installed:

    python --version

Update system packages and ensure virtualenv is installed:

    $ sudo apt-get update
    $ sudo apt-get -y install python-virtualenv

### 2. Install Sentinel

Clone the Sentinel repo and install Python dependencies.

    $ git clone https://github.com/scribenetwork/sentinel.git && cd sentinel
    $ virtualenv ./venv
    $ ./venv/bin/pip install -r requirements.txt

### 3. Set up Cron

Set up a crontab entry to call Sentinel every minute:

    $ crontab -e

In the crontab editor, add the lines below, replacing '/home/YOURUSERNAME/sentinel' to the path where you cloned sentinel to:

    * * * * * cd /home/YOURUSERNAME/sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1

### 4. Test the Configuration

Test the config by runnings all tests from the sentinel folder you cloned into

    $ ./venv/bin/py.test ./test

With all tests passing and crontab setup, Sentinel will stay in sync with dashd and the installation is complete

## Configuration

An alternative (non-default) path to the `scribe.conf` file can be specified in `sentinel.conf`:

    scribe_conf=/path/to/scribe.conf

## Troubleshooting

To view debug output, set the `SENTINEL_DEBUG` environment variable to anything non-zero, then run the script manually:

    $ SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py

### License

Released under the MIT license, under the same terms as Scribe itself. See [LICENSE](LICENSE) for more info.
