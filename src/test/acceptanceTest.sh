#! /usr/bin/env sh

function testItCanProvideAllTheScores() {
    cd ..
    ./tennisGame.sh ./input.txt > ./results.txt
    diff ./output.txt ./results.txt
    assertTrue 'Expected output differs.' $?
}

. "shunit2"