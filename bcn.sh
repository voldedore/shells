#!/bin/bash

# Get current date
day=`date +'%d'`
month=`date +'%m'`
year=`date +'%Y'`

# Current dir to cp file to
dir="/Users/thevinh/Google Drive/BAOCAONGAY/$year-$month"

# Get last working day
if [ $(date +%w) == 1 ] ; then
    last_day=`date -v-3d +'%d'`
    last_month=`date -v-3d +'%m'`
    last_year=`date -v-3d +'%Y'`
    # date -v-3d +'%Y/%m/%d'
else
	last_day=`date -v-1d +'%d'`
	last_month=`date -v-1d +'%m'`
	last_year=`date -v-1d +'%Y'`
    # date -v-1d +'%Y/%m/%d'
fi

# Get last dir to cp file from
last_dir="/Users/thevinh/Google Drive/BAOCAONGAY/$last_year-$last_month"

# Copy file from last dir to current dir
if [[ ! -d "$dir" ]]; then
	mkdir "$dir"
fi
cp -a "$last_dir/BaoCaoNgay-$last_day"_"$last_month"_"$last_year-VoTheVinh.docx" "$dir"/"BaoCaoNgay-$day"_"$month"_"$year-VoTheVinh.docx"
# done

echo "Today is $day $month $year"
