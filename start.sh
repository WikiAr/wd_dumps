#!/bin/bash
git clone https://github.com/WikiAr/wd_dumps.git

cd wd_dumps

pip install -r requirements.in

# first step
python3 dump27/most_props.py

# process the dumps
python3 dump27/r_28.py all_props

# make report from the dumps:

## labels reports
python3 dump27/labels/tab_fixed.py
python3 dump27/labels/text.py

## sitelinks reports
python3 dump27/sitelinks.py

## claims reports
python3 dump27/claims_max/bot.py
python3 dump27/claims_max/text.py
