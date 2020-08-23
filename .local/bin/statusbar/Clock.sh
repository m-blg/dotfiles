#!/bin/sh

xsetroot -name "$(date "+%Y %b %d (%a) %I:%M%p")"
sleep $(( 60 - $(date "+%S") ))s

while :; do
    xsetroot -name "$(date "+%Y %b %d (%a) %I:%M%p")"
    sleep 1m
done
