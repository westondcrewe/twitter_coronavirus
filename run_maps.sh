#!/bin/sh

for file in /data/Twitter\ dataset/geoTwitter20-*.zip; do
	echo "mapping file $file"
	./src/map.py --input_path="$file"
done
