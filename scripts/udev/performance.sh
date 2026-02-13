#!/bin/bash
# exit if command failed
set -e
set -o pipefail

command_input=$1
governor_input=$2

function print_help() {
  echo './performance.sh <options>
  Options:
    list - print available energy profiles
    help - print this help
    current - print current energy profile
    powersafe - set powersafe configuration
    performance - set perfomance configuration
    balanced - set balanced configuration'
}

function list() {
  powerprofilesctl list
}

function set_profile() {
  input=$1
  powerprofilesctl set $input
}

function get_current_profile() {
  powerprofilesctl get
}

function powersave() {
  set_profile power-saver
}

function performance() {
  set_profile performance
}

function balanced() {
  set_profile balanced
}

case "$command_input" in
  (list) list;;
  (current) get_current_profile;;
  (powersave) powersave;;
  (performance) performance;;
  (balanced) balanced;;
  (help | *) print_help;;
esac
