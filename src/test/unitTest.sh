#! /usr/bin/env sh

source ../functions.sh

function testItCanProvideFirstPlayersName() {
    assertEquals 'John' `getFirstPlayerFrom 'John - Michael'` 
}

function testItCanProvideSecondPlayersName() {
    assertEquals 'Michael' `getSecondPlayerFrom 'John - Michael'`
}

. "shunit2"
