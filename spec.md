# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- Installed & required Sinatra gem.
- [x] Use ActiveRecord for storing information in a database
- Installed & required ActiveRecord and Sinatra-ActiveRecord gems, used migrations to build database tables.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
- 3 Models: Provider, Patient, Condition
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
- Provider has_many Patients; Patient has_many Conditions.
- [x] Include user accounts
- Providers (users) can sign up and log in.
- [x] Ensure that users can't modify content created by other users
- Authentication features check for provider to be logged in and will redirect if not logged in or not the correct provider.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- Both Patients and Conditions can be created, viewed, edited, and deleted.
- [x] Include user input validations
- Signup and login fields are required before submitting; patient information is required; basic condition details are also required.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
- Failure alerts display for: username exists, could not find username, incorrect password.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
- Added Readme, MIT license, and code of conduct to repository.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
