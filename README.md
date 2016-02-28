# BrainStormer
Teams brain-storm ideas and they vote their favorite one

Description
----
A project made during the lab week at makers academy. In Week 6 they let us explore
any technologies/languages we like and try to create a small project.
The idea of this project is that teams can quickly post ideas and vote their favorite one.
My approach was to use the knowledge from the previous weeks and combine them
with some extra information in order to proceed with this project.

Technical Details
----
**BackEnd**
* For the backend i've used the Sinatra framework(modular style) with PostgreSql and DataMapper.
* For access to the database i created a JSON Restful API.

**FrontEnd**
* For the frontend i'm using HAML for cleaner html with Sinatra partials to separate my HAML files into smaller ones, and the Bootstrap framework for my css design.
* I've used JQuery to access the JSON API through AJAX calls, eliminating costly page refreshes as much as possible.

How to use
----
* git clone https://github.com/AlexAvlonitis/BrainStormer.git
* Create a postgres db brainstormer_development
* bundle install
* rake db:auto_migrate
* rackup
* visit http://localhost:9292

To DOs
----
Incomplete tasks, for the future
* User to be able to vote only once per team
* Refactor the code to be more DRY
* Move some of the business logic at the model level
* Complete authentication system
