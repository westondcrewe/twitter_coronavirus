# Twitter Coronavirus MapReduce Project

This project takes zipped files containing data about geotagged tweets, and follows the MapReduce model to analyze and visualize the dataset based on tweet hashtags, countries of origin, and languages. The MapReduce framework allows us to take our large scale dataset and analyze it in a parallel procedure. 

The dataset is partitioned daily and hourly. There are 365 zip files, one for twitter data for each day of 2020. Each zip file has 24 text files, one for twitter data from every hour of that day. The text files store data in a JSON format with one line for each tweet.

The ```src/``` folder holds every Python file that we use for the project. 

The ```map.py``` file takes zip files as input, and will store the daily aggregate counts of tweets containing several different hashtags, all of which related to the COVID-19 pandemic, such as #coronavirus, #covid19, #flu, and #코로나바이러스. The code will store these counts in Python dictionaries, and they will track the counts on two variables: 1) country_code, 2) lang. The country_code data holds the number of tweets of each hashtag for each country_code, which represents the country from which the tweet was sent. The lang data holds the number of tweets of each hashtag for each language in which the tweets were written in. The output of ```map.py``` is two files, one for the country_code counts, and one for the lang counts.  

A shell script ```run_maps.sh``` was written to run the mapper on every zip file, producing country_code and lang count data for every day of 2020. The outputs of this script are in the ```outputs/``` folder. 

The ```reduce.py``` file was used to combine all of the lang files into one, and all of the country_code files into one. 

The ```visualize.py``` file was used to generate four .png files, ```country_#coronavirus_plot.png```, ```country_#코로나바이러스_plot.png```, ```lang_#coronavirus_plot.png```, ```lang_#코로나바이러스_plot.png```. These files are bar plots that display the top 10 countries or languages in terms of total tweets in 2020 containing the given hashtag. So, ```country_#coronavirus_plot.png``` shows the top 10 countries with the most tweets containing #coronavirus in 2020. 

The ```alternative_reduce.py``` file combined the processes of ```reduce.py``` and ```visualize.py```. It takes as input a list of hashtags, and produces a line plot in which each hashtag has one line, the x-axis is the date, and the y-axis is the number of tweets of the given hashtag for each day. Two .png files were made with this file. ```daily_#coronavirus_#covid19_#corona_tweets_plot.png``` plots the daily tweet counts for the hashtags #coronavirus, #covid19, and #corona, which were the three most popular of the counted hashtags. ```daily_#coronavirus_#covid19_#virus_#코로나바이러스_#コロナウイルス_#冠状病毒_#covid2019_#covid-2019_#covid-19_#corona_#flu_#sick_#cough_#sneeze_#hospital_#nurse_#doctor_tweets_plot.png``` plots the daily tweet counts for every counted hashtag.      
