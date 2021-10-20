#!/bin/bash

echo "Searching for files inside subdirectories. This might take a while..."
maindir=$(pwd)
for filedir in $(find . -print | grep -i .html)
do
    filename=$(basename $filedir)
    cd $(dirname $filedir | sed 's,./,,')
    echo "Changing to $(dirname $filedir)"
    author=$(grep -Po '"author" *content="\K[^"]*' $filename)
    echo "Found author $author"
    title=$(grep -Po '"title" *content="\K[^"]*' $filename)
    if [ -z "$title" ]; then
    title=$(grep -Po '<title>\K[^</title>]*' $filename)
    fi
    if [ -z "$author" ]; then
    author=$(grep -Po 'content="\K[^" name="author"]*' $filename)
    fi
    if [ -z "$author" ]; then
    author="Unbekannter Autor"
    fi
    echo "Converting $filename as $title from $author"
    iconv -f ISO-8859-15 -t utf-8 $filename | sed -E 's/charset="iso-8859-15"/charset="utf-8"/' | pandoc -f html -o "${filename%.html}.epub"
    mkdir --parents "$maindir/E-Books/$author/$title"

    if [[ -z "$title" ]]; then
        mkdir --parents "$maindir/E-Books/$author"
        mv "${filename%.html}.epub" "$maindir/E-Books/$author/${filename%.html}.epub"
    elif [[ ! -z "$title" ]]; then
        mkdir --parents "$maindir/E-Books/$author/$title"
        mv "${filename%.html}.epub" "$maindir/E-Books/$author/$title/${filename%.html}.epub"
    fi
    
    cd $maindir
done
echo "Finished converting all files. Exiting regularly."