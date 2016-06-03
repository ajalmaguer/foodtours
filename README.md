Food Tours
==========
This is my first Ruby on Rails project. I made it for the 2nd project of the Web Development Immersive class that I took from General Assembly. I'm part of the Downtown LA 9 cohort.

The goal of Food Tours was to answer the question, "What should I eat when I travel to ____?" I've been asked this question many times from friends who travel to Chicago or the Bay Area, both places I've lived before. While yelp is great at giving all the information you need, there's still a need for a curated list of restuaruants AND what to order at those restaurants. 
Users upload "food landmarks" which are supposed to be specific dishes at a certain restaurant. Users can then organize landmarks into their own "tours," which display a list of the landmarks on that tour as well as a google map of where the landmarks are located.

Special thanks to Pinterest for inspiring the user experience design and my friends for inspiring my love of good food. :)

This app is currently deployed on Heroku at: [https://foodtours.herokuapp.com/](https://foodtours.herokuapp.com/)


Technologies Used
=================
This Ruby on Rails project was built using Ruby 2.2.3 and a Postgresql database.


The following gemfiles were installed:
----------------------------------------

Gemfile    |   Purpose
----        |   -----
bcrypt      |   User authentication; Use ActiveModel has_secure_password
twitter-bootstrap-for-rails | Basic styling needs and grid layouts
paperclip   |   Handles file upload of images
geocoder    |   Handles geocoding of addresses, converts them into longitude, latitude coordinates
gmaps4rails |   Maps the long, lat coordinates on an interactive map using google maps javascript api (*Warning:* documentation of this gem is poor and out of date.)
aws-sdk     |   Amazon web services: handles image file storage


The following javascript libraries were also used:
------------------------------------------------

JS Library  | Purpose
----        | ----
masonry.js  | Augments the Bootstrap grid with the ability to fit elements of different heights together into a "pinterest-like" layout.
imagesLoded.js  | Used in conjunction with masonry.js to "relayout" the page into the "masonry" layout only after all images have been loaded.

Entitiy Relationship Diagram
-----------------------------

![erd](https://raw.githubusercontent.com/ajalmaguer/foodtours/master/erd-2.png)


Pivotal Tracker for Food Tours
------------------------------
The project's user stories are documented and managed on pivotal tracker. See the project here: [https://www.pivotaltracker.com/n/projects/1571177](https://www.pivotaltracker.com/n/projects/1571177)

Installation Instructions
==========================
1. Clone the repo from your terminal `git clone https://github.com/ajalmaguer/foodtours.git`
2. Go into the directory and perform the following
  1. Install the gems `bundle install`
  2. Create the database: `rake db:create`
  3. Migrate the database: `rake db:seed`
  4. Run rails server: `rails s`
3. Connect to rails server from the browser. I.e. go to `localhost:3000`
4. To get the file upload working, set up an [Amazon Web Services Account](http://aws.amazon.com/) and save your api key info on your bash profile. Also update your `development.rb` and `production.rb` files. **WARNING: DO NOT PUSH YOUR API KEY INFO TO GITHUB!**


Next Steps
=================
The next steps I'd like to take for this project are as follows:
1. Implement user profiles, which shows a user's own landmarks and tours.
2. Implement "likes" or "following" so that a user can essentially bookmark landmarks and tours onto their own profile.
3. Implement "I ate this" to keep track of which landmarks a user has eaten while embaring on a food tour.
