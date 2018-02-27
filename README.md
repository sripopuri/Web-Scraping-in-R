# Web-Scraping-in-R

Images count: 11,760
Number of Cars: 147
These cars are selected as the top selling passenger cars of the year 2017 in United States of America.

I need to scrape the images for my project. The initial plan is to scrape 80,000 images, but finally I decided that for my project 11,760 images will be sufficient. Hence I am going with this number which includes images of 147 different cars! But with the same piece of code I can go ahead and scrape 80,000 images too.

The idea of the project is confidential but, I need some huge volume of pictures of cars. So I need to scrape the data from web.

For my project I need to scrape some perfect images of the cars. You want me define perfect? I need images of cars similar to those which are in the websites of the automobile companies. But with R, it is not possible to scrape images from the secured images.

So I decided to go with google images. This piece of code which I have written will get the images of cars from google images tab and arrange them into folders in my local system in respective folders of cars which are istantly created on the fly!

The challenge with scraping images from google images tab is, there is high possibility to scrape some junk images too which are not relevant to the specific car of view. I am interest in the exterior images of the cars, but guess what, we get interior images of the cars as well when enter google images tab.

Hence to narrow down my scraping to the relevant pictures I have written my code in such a way that it only scrapes the specific views of my cars of interest. The views being, front view, back view, side view and diagonal view.

When these images are being scraped, the working directory is changed on the fly as well as new folders for each of the cars will be created on the fly and finally cars of the specific model fall into single folder.

The reason for doing it this way is...Just to have some clean work environment so that I can easily access and clean any folder related any car if required rather than dumping all the 11,760 images of data into a single folder. 
