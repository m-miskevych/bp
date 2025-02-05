# README

## Run the Application

```bash
   bin/dev
```

## PLANNING

### v.1
- [x] Create `Exercise` and `Plan` models
- [x] Define a many-to-many relationship between `Exercise` and `Plan`
- [x] `Exercise` CRUD operations
- [x] `Plan` CRUD operations
- [x] Add an admin home page.

- [x] Add validations
  - [x] Exercise Model
  - [x] Plan Model

- [x] Add I18N support for sk/en language
- [x] Add Active Storage - images upload
  - [ ] Image Upload - style 
- [ ] Add Active Storage - video upload - or via link to YT ?
- [ ] Add ActionText gem for descriptions

- [x] Install and configure Tailwind CSS
- [x] Style
  - [x] style Admin page
  - [ ] style Exercise
  - [ ] style Plans
  - [ ] navbar

- [ ] Divide admin / user namespaces
- [ ] Add Flash Messages for success and errors

- Exercise 
  - [ ] index page - implement search
  - [ ] index page - implement pagination
  - [ ] index page - order by name
  - [x] index page - add cover img 

BUGS
- [x] Delete Exercise Associated to a Plan - how to handle it ? can not delete if exercise is assigned to a plan
- [ ] Missing translations for error messages
- [ ] Plan - Exercise -> make it redirect to exercise detail page
- [ ] Better visualization for Detail, Edit, Delete Buttons

### v.2
- [ ] Add `User` model - Physiotherapist, Client ( admin? )
- [ ] Add authentication and authorization - Device gem
  - [ ] Physiotherapist registration with profile (name, company)
  - [ ] Client registration via invite link

### v.3
- [ ] Add Reservation system

### v.4
- [ ] Cypress Tests
