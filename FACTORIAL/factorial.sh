#! /bin/bash

NUMBER=$1

echo '#! /bin/bash'>dc_fact.sh
echo "NUMBER=$NUMBER" >> dc_fact.sh
yes 'dc -e "$NUMBER 1 -"; NUMBER=$( dc -e "$NUMBER 1 - p" );' | head -n$NUMBER >> dc_fact.sh

