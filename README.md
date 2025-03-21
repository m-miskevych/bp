# BP Project Documentation

## 1. Setup Instructions

### 1.1 Install Required Dependencies

1. **Ruby, Rails, PostgreSQL**  
   Follow this [guide](https://gorails.com/setup/macos/14-sonoma) to install Ruby, Rails, and PostgreSQL.

2. **ImageMagick**  
   If images are not displaying correctly, install [ImageMagick](https://guides.rubyonrails.org/active_storage_overview.html#requirements).


### 1.2 Clone the Repository
```bash
  git clone git@github.com:m-miskevych/bp.git
```

### 1.3 Navigate to the Project Directory
```bash
  cd bp
```

### 1.4 Install Dependencies
```bash
  bundle install
```

### 1.5 Set Up the Database
```bash
  rails db:create
  rails db:migrate
  rails db:seed
```

## 2 Run the Application
```bash
   bin/dev
```
> [!TIP]
> Accessing Localhost on Mobile
> 1. Find your local IP address
> 2. Start the Rails server  `bin/dev`
> 3. On your mobile device, open a browser and enter: `http://[YOUR_IP_ADDRESS]:3000`
> 4. Ensure your computer and mobile device are connected to the same Wi-Fi network


### 2.1 Login Credentials
You can log in with the following credentials:
+ Admin1: admin1@example.com / 123123
+ Admin2: admin2@example.com / 123123
+ Client1: client1@example.com / 123123
+ Client2: client2@example.com / 123123
+ Client3: client3@example.com / 123123
+ Client4: client4@example.com / 123123

## 3. Testing

### 3.1 Run RSpec model tests
```bash
bundle exec rspec spec/models
```

### 3.2 Run Capybara tests
```bash

```

## 4. PLANNING

BUGS
+ Delete Exercise Associated to a Plan - how to handle it ? can not delete if exercise is assigned to a plan
+ Plan - Exercise -> make it redirect to exercise detail page
+ Better visualization for Detail, Edit, Delete Buttons
+ In Plans, amdin can see only his clients assigned to the plan
- [x] exercise -> set and repetition are required
- [ ] exercise show detial -> if img or video are missing, adjust the view

🏋️ Exercise Model
+ Create `Exercise` and `Plan` models
+ Define a many-to-many relationship between `Exercise` and `Plan`
+ `Exercise` CRUD operations
+ Add an admin home page.
+ Add validations
   + Exercise Model
+ Add Active Storage - images upload
- [x] Implement video upload via Active Storage or link to YouTube ( iframe ) 

📋 Plan Model
+ `Plan` CRUD operations
+  Add validations
   + Plan Model
- [x] Add a status bar for plans
- [ ] Add a timer functionality for plans
- [ ] Add a progress bar for plans

👤 User Model & Authentication
+  Divide admin / user namespaces
- [x] Enable client registration via an invite link

💬 Comments Model
- [x] Add comment system to plans

🗓️ Reservation System
- [ ] Add reservation system for booking physiotherapy sessions
- [ ] Implement calendar view for physiotherapists
- [ ] Allow clients to request appointments

🌍 Translations & I18N
+  Add I18N support for sk/en language
- [x] Implement language switcher with SK/EN flags
- [x] Form - exercise language switcher
- [x] Form - plan language switcher

🔔 Flash Messages 
+  Add Flash Messages for success and errors
- [ ] Flash messages - stimulus 

🎨 Styling & UI (Tailwind)
+  Install and configure Tailwind CSS
+  Style
  +  style Admin page
  +  navbar mobile view
- [ ] Extract commonly used Tailwind classes into reusable components
- [x] Views styling
  - admin
    - [x] nav bar
    - [x] dashboard page
    - [x] exercises 
    - [x] plans
    - [x] user_plans
    - [x] users
    - [x] "profile" page
  - client
    - [x] nav bar
    - [x] dashboard page
    - [x] user_plans


📦 Other
- [ ] Rethink redirections in controllers

🔬 Testing
+  Add RSpec tests for models
   +  Exercise model
   +  Plan model
   +  ExercisesPlan model
   - [ ] User model
   - [ ] UserPlan model
- [ ] Add Capybara tests
--- 

