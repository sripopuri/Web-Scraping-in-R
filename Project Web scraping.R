# Cleaning my workspace
rm(list = ls())

library(rvest) # For Scraping the data
library(stringr) # For String operations

# Checking and seting the work space
getwd()
setwd("D:/Project/Project Files")

# Getting the names of the cars from spread sheet
car_list = read.csv('List of Cars and URLs.csv', header = FALSE)
colnames(car_list) = "car names"
car_list = head(car_list, n = 2)

# Initial diagnostics on data
nrow(car_list)
sum(is.na(car_list))

# removing any trailing/leading spaces
car_list[,1] = trimws(car_list[,1])

# Replacing spaces with "+"
replaced = car_list[,1]
replaced = str_replace_all(replaced," ","+")
replaced = as.data.frame(replaced)
car_list = cbind(car_list,replaced)

# For concatenating the parts of URL
lead = "https://www.google.com/search?q="
trail = "&source=lnms&tbm=isch"
link = character()

# for(i in 1:nrow(car_list)){
#   link[i] = paste0(lead,replaced[i],trail)
# }

# car_list$link = link

# Different 'view' angles that need to used in querying
views = c("front+view","back+view","side+view","diagonal+view")
views_names = c("front view","back view","side view","diagonal view")
length(views)


for(i in 1:nrow(car_list)){
  
  setwd("D:/Project/Project Test center")
  
  # Creating a new directory for each car
  dir.create(car_list[i,1])
  
  # For setting the specific directory of car
  directory = paste0("D:/Project/Project Test center","/",car_list[i,1])
  
  for(j in 1:4){
    
    ht = paste0(lead,car_list[i,2],"+",views[j],trail)
    page <- read_html(ht)
    node <- html_nodes(page,xpath='//img')
    source <-  html_attr(node,"src")
    dest = character(0)
    
    # Writing names for the images
    for(index in 1:20){
      p = as.character(index)
      dest[index] = paste0(p," ",car_list[i,1]," ",views_names[j],".jpeg")
    }
    
    # To download the specific car images in its library
    setwd(directory)
    
    for(image in 1:20){
      download.file(source[image],
                    destfile = dest[image],
                    mode = "wb")
    }
  }
  
}

# Setting back the working directory
setwd("D:/Project/Project Test center")
