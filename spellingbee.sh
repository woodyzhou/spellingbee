#!/bin/bash

VOICE="Samantha"

getc() {
  IFS= read -r -n1 -p 'Press [r] repeat, [s] repeat slowly, [d] definition or any key to continue ...' "$@"
}

readword() {
	if [ "$#" -gt 1 ] ; then
		say -v $VOICE -r $2 $1
	else
		say -v $VOICE $1
	fi
}

definition() {
	open dict://$1
}

testword() {
	WORD=$1
	SPEED=$2
	echo ""
	echo ">> $WORD <<"
	readword $WORD $SPEED
	getc C
	case $C in 
		"r")
			testword $WORD;;
		"s")
			testword $WORD 100;;
		"d")
			definition $WORD
			testword $WORD
			;;
		*) ;;
	esac
}

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ] ; then
  echo "Usage: $0 COLUMN_IDX [SEQ|RANDOM]" >&2
  say -v $VOICE "Unexpected input parameters"
  exit 1
fi

COLUMN=$1
ORDER=${2:-RANDOM}

if [ "$ORDER" != "SEQ" ] && [ "$ORDER" != "RANDOM" ] ; then
  echo "Usage: $0 COLUMN_IDX [SEQ|RANDOM]" >&2
  say -v $VOICE "Unexpected order type. Please use SEQ or RANDOM."
  exit 1
fi

FILENAME="spelling_bee_$COLUMN.txt"

if [ -f $FILENAME ]; then
	COMMAND="cat $FILENAME"
	if [ "$ORDER" = "RANDOM" ]; then 
		COMMAND="cat $FILENAME | perl -MList::Util=shuffle -e 'print shuffle(<STDIN>);'"
	fi
	echo "===== Start ====="
	say -v $VOICE "Start checking words of column '$COLUMN'"
	say "..."
	for WORD in `eval $COMMAND`
	do
		testword $WORD
	done
	echo "===== Finish ====="
	say -v $VOICE "Column '$COLUMN' finished!"
else
  echo "$FILENAME not found... Exit!" >&2
  say -v $VOICE "Cannot find word file of column '$COLUMN'. Please double check!"
  exit 1
fi