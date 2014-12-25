Moodstagram
===========
Moodstagram is the week 8, individual challenge at Makers Academy. This challenge is testing our skills of building Ruby-on-Rails applications. 
Specification
-------------
Moodstagram is a clone of the popular photosharing apllication Instagram. In Moodstagram users can share photos which reflect their mood/feelings on a particular day or at a paticular time. Moodstagram has the following functionality:
* users can sign-up, log-in and log-out
* users can post moods (mood includes a picture and the authors' mood)
* users write comments on moods
* users can like moods
* users can purchase other users' moods

<img src="https://s3-eu-west-1.amazonaws.com/annas-first-test-bucket/moodstagram.png">
Languages and Tools
-------------------
* Ruby
* Rails
* PostgreSQL
* RSpec
* Capybara
* Stripe
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

In order to use the payment system please register application with stripe and provide stripe api key and secret in config/secrets.yml

