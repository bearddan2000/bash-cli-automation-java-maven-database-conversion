#! /bin/bash

function replace_readme_str() {
  #statements
  local file=$1/README.md
  local old=$2
  local new=$3

  perl -pi.bak -e "s/${old}/${new}/" $file
  rm -f $1/README.md.bak
}

function replace_readme_first() {
  #statements
  local file=$1/README.md
  local old=$2
  local new=$3

  perl -pi.bak -0 -e "s/${old}/${new}/" $file
  rm -f $1/README.md.bak
}

d=$1

platform=$2

replace_readme_str $d "${platform}-gradle" "${platform}-maven"

replace_readme_first $d "- gradle" "- maven"

replace_readme_first $d "gradle" "maven"

replace_readme_str $d "- gradle:jdk11" "- maven:3-openjdk-17"
