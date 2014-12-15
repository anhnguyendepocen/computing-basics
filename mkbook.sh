#!/bin/sh

# Run this bash script to create a PDF book of Computing Basics wiki.
# Tested on Ubuntu 14.04. Requires "Asciidoc" package.  BKH 2014-12-15
#
# Before running, clone the wiki prepository and enter that folder.
#  $ git clone https://github.com/brianhigh/computing-basics.wiki.git
#  $ cd computing-basics.wiki.git
#
# Also put a2x.conf in that folder.
#
# For this to make a decent book, the asciidoc pages from the wiki need
# to start with a blank line and need to *not* contain a level 0 header.

git pull

echo "= Computing Basics =" > Header.asciidoc

cat Header.asciidoc \
    Home.asciidoc \
    Footer.asciidoc \
    tldr.asciidoc \
    networking.asciidoc \
    security.asciidoc \
    resource_management.asciidoc \
    files.asciidoc data.asciidoc \
    > computing_basics.asciidoc

a2x --conf-file=a2x.conf -d book -f pdf computing_basics.asciidoc
