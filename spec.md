# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - I used Sinatra.
- [x] Use ActiveRecord for storing information in a database - I used ActiveRecord.
- [x] Include more than one model class (e.g. User, Post, Category) - I have User and Attraction model classes
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has_many Attractions
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Attraction belongs_to User
- [x] Include user accounts with unique login attribute (username or email) - User has a Username attribute
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - There are routes for them all.
- [x] Ensure that users can't modify content created by other users - Using credentials in session to check against the content owner. Also hid the relevant controls for better user experience.
- [x] Include user input validations - 1. Enforced max length of user details on signup, 2. Two password fields to confirm accuracy when signing up. 3. Checked for existing usernames when signing up 4. On login,checked username and password matches. 5. Stripped whitespace on signup.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - Used Rack-flash to put in helpful messages at various points after user submits data.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
      
Confirm
- [x] You have a large number of small Git commits - The inital setup was alarge commit, sometimes I forget to commit. Committed when remembered
- [x] Your commit messages are meaningful - As meaningful as I can make, sometimes I had character limit issues(symptom of doing too much between commits)
- [x] You made the changes in a commit that relate to the commit message - Generally the case.
- [x] You don't include changes in a commit that aren't related to the commit message - Mostly, sometimes I tweaked things elsewhere without thinking. 
