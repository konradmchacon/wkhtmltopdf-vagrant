#!/bin/bash

export SET_X="set -x"

$SET_X

# --------------------------------------------
# initialize the box (includes installing software)
# --------------------------------------------
/vagrant/vagrant/init-box.sh
/vagrant/vagrant/init-mysql.sh

