# Friend Connector

----
## Heroku
 [See Friend Connector live on Heroku](http://friend-connector.herokuapp.com)

http://friend-connector.herokuapp.com

>
Ruby on Rails application that allows users to enter their name and a website to register. Upon registration, the website is scraped for all headings, and headings are stored as that user's interests. Users can form bidirectional friendships with other members and search for new friends by a topic of interest.

----
## Run Locally
1. Clone this repository to your local machine.
2. Run `bundle install` to install gem dependencies.
3. Run `rails db:create  db:migrate` to create and migrate database.
4. Run `rails s` to start the server and make note of port number.
5. You should be able to view app locally at the localhost address returned.

----
## Test Locally
1. Run `bundle exec rspec` to run full suite.
2. After running test suite, visit `coverage/index.html` in the browser to assess coverage of tests.
