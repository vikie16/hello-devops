#!/usr/bin/env bash
# Linux treasure hunt. Run from the repo root in Git Bash:  bash maze/make-maze.sh
set -e
rm -rf island && mkdir -p island && cd island
for a in beach jungle cave village harbour; do
  for b in north south east west; do
    mkdir -p "$a/$b"
    echo "Nothing here but sand. Keep looking." > "$a/$b/note.txt"
  done
done
echo "Clue 1: pirates hide things in files that start with a dot. Try: ls -a  inside jungle/east" > START_HERE.txt
echo "Clue 2: one note.txt on this island contains the word GOLD. Try: grep -r GOLD ." > jungle/east/.secret
echo "GOLD! Clue 3: there are 50 chests in village/north and only one holds the treasure. The chest number is the number of lines in harbour/west/ship.log. Count them with: wc -l" > cave/south/note.txt
for i in $(seq 1 41); do echo "day $i: calm sea" >> harbour/west/ship.log; done
echo "day 42: buried the treasure" >> harbour/west/ship.log
for i in $(seq -w 1 50); do
  mkdir -p "village/north/chest-$i"
  echo "Empty. Wrong chest! The ship's log knows the right number." > "village/north/chest-$i/treasure.txt"
done
echo "FLAG{linux-is-not-scary}  Shout it out to win!" > village/north/chest-42/treasure.txt
echo "Island created. Start with:  cd island   then   cat START_HERE.txt"
