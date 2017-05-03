#! /usr/bin/env sh

function getFirstPlayerFrom() {
    echo $1 | sed -e 's/-.*//'
}

function getSecondPlayerFrom() {
    echo $1 | sed -e 's/.*-//'
}
