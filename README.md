<img src='app/assets/images/logo2.png' width="201" height="110">

# Q4U Web Application

## Summary
Q4U web application is an easy-to-use app that provides a free information swapping platform for people who have difficulties when queue by person. 

Live demo of the application: https://queue4u.herokuapp.com/

## Introduction
The intention of the app is to help the person to find someone to queue for him/her at somewhere the virtual queue service is not available. At the meanwhile, the app provides the opportunities for others who have the resources of either spot convenience or spare time to earn more money to make their life better as well.<br><br>
Registered user can create a post to describe the details of queue request needed or queue service provided. If someone is good match of your post, it will be collected. The email notification is send to you.<br><br>
Q4U offers credit system for all registered users as a reference for filtering the candidates. Each user or visitor can view the credit number and reviews of any registered user by the user name link in post, comment and review part.The credit is the average rating of all reviews of a user, and each review is rating by the other one who made a deal with the user. The post creator could constraint the collector’s credit when setup the request post to filter the lower credit vendors.<br><br>
Q4U brings the comment function to each post to help both demander and potential vendors to dynamically clarify the needs. It is a supplement tool to improvement the clarity of request from the requestor.


## Project Keys

#### 1. Preparasion
This application is developed by Ruby On Rails. If you want to download the code and run locally, it is important to set up development environment first.

Here is a reference of setting up your development environment using the Windows Subsystem for Linux. https://www.endpoint.com/blog/2019/04/04/rails-development-in-windows-10-pro-with-visual-studio-code-and-wsl

* Install Ruby - version 2.6.3

* Install Rails - version 6.0.2.2

#### 2. Run Locally
For local development download git repository, navigate to the downloaded folder and open it with VSCode IDE.

````diff
+ Install dependencies in Gemfile
  bundle install

+ Install all the dependencies listed within package.json 
  yarn install --check-files

+ Run server
  Rails server

+ open the application on localhost:3000
````
#### 3. Test
RSpec framework is installed for testing as well as other tools specified in Gemfile. All testing cases are under spec folder. 
````diff
+ Run test cases in terminal
  rspec
# output:  17 examples, 0 failures
````
#### 4. Deployment
[Heroku: Cloud Application Platform](https://www.heroku.com/) Heroku is a platform as a service (PaaS) that enables developers to build, run, and operate applications entirely in the cloud.



