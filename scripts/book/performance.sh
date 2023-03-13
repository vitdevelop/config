#!/bin/bash
# exit if command failed
set -e
set -o pipefail

available_governors_path="/sys/devices/system/cpu/cpufreq/policy0/scaling_available_governors"
current_governors_path="/sys/devices/system/cpu/cpufreq/policy0/scaling_governor"
set_governor_template_path="/sys/devices/system/cpu/cpufreq/policy<cpu_num>/scaling_governor"
set_governor_wildcard_path="/sys/devices/system/cpu/cpufreq/policy*/scaling_governor"
set_cpu_energy_wildcard_path="/sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference"
command_input=$1
governor_input=$2
apply_sudo=""

if [ $(id -u) != "0" ]
then
  apply_sudo="sudo"
fi

function print_help() {
  echo './performance.sh <options>
  Options:
    list - print available scaling governors for current CPU
    set <type> - set governor, type must be from available governors
    help - print this help
    current - print current governor for CPU
    powersafe - set powersafe configuration
    performance - set perfomance configuration'
}

function list() {
  cat $available_governors_path
}

function set_governor() {
  function_governor_input=$1
  # check if argument passed
  if [ -z "$governor_input" ] && [ -z "$function_governor_input" ]
  then
    echo "<type> is empty"
    print_help
    exit 1
  fi

  if [ -n "$function_governor_input" ]
    then
      governor_input=$function_governor_input
  fi

  # check if governor is available
  available_cpu_governors=($(list))
  governor_type=""
  for governor in "${available_cpu_governors[@]}"; do
    if [ $governor == $governor_input ]
    then
      governor_type=$governor
    fi
  done

  if [ -z "$governor_type" ]
    then
      echo "$governor_input is not available"
      print_help
      exit 1
  fi

  cpu_size=$(grep -c ^processor /proc/cpuinfo)

  # set current governor
#   cpu_limit=$((cpu_size-1))
  # for cpu in $(seq 0 $cpu_limit); do
  #   sudo bash -c "echo $governor_type > ${set_governor_template_path/<cpu_num>/$cpu}"
  # done
  echo "$governor_type " | $apply_sudo tee $set_governor_wildcard_path > /dev/null

  get_current_governor
}

function set_cpu_energy() {
  echo "$1" | $apply_sudo tee $set_cpu_energy_wildcard_path > /dev/null
}

function get_current_governor() {
  cat $current_governors_path
}

function powersave() {
  set_governor powersave
  set_cpu_energy default
}

function performance() {
  set_governor performance
  set_cpu_energy performance
}

case "$command_input" in
  (list) list;;
  (set) set_governor;;
  (current) get_current_governor;;
  (powersave) powersave;;
  (performance) performance;;
  (help | *) print_help;;
esac
