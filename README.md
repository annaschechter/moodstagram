Moodstagram
===========
Yelp Clone is the week 8 project at Makers Academy. In this we learnt to Ruby-on-Rails applications.
Specification
-------------
Moodstagram is a clone of the popular photosharing apllication Instagram. In Moodstagram users can share photos which reflect their mood/feelings on a particular day or at a paticular time. Moodstagram has the following functionality:
* users can sign-up, log-in and log-out
* users can post pictures
* users write comments on pictures
* users can like pictures
* users can purchase other users' moods

<img src="https://s3-eu-west-1.amazonaws.com/annas-first-test-bucket/moodstagram.png">
Languages and Tools
-------------------
* Ruby
* Rails
* PostgreSQL
* RSpec
* Capybara
* HTML
* CSS

How to use
----------
Clone the repository:
```
$ git clone https://github.com/annaschechter/moodstagram.git
```
Install the gems:
```
$ bundle install
```
Create test and development databases:
```
$ psql
# create database colourgram_test;
# create database colourgram_development;
```
Migrate test and development databases:
```
$ bin/rake db:migrate RAILS_ENV=development
$ bin/rake db:migrate RAILS_ENV=test
```
Install ImageMagick:
```
$ brew install imagemagick
```
Run RSpec to see the tests:
```
$ rspec
```
Start the app:
```
$ rails s
```
In your browser visit http://localhost:3000/

