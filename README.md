# AskWhat-backend

Backend of AskWhat, an online forum for CVWO assignment.
Built with Ruby on Rails.

Frontend Repository: https://github.com/slye20/AskWhat-frontend/

Link to deployed app: https://askwhat-1b26934c0d62.herokuapp.com/

Creator: Samuel Lim Yong En

## Download Instructions

Install Git and ruby 3.2.2 if you haven't already (ruby 3.2.2 was used for the development of the application).

Clone the repository:

```
git clone https://github.com/slye20/AskWhat-backend
```

Install all dependencies:

```
bundle install
```

Create db and migrate schema:

```
rake db:create
rake db:migrate
rake db:seed
```

Run application

```
rails s
```

And now you can visit the site with the URL http://localhost:3000

## What's included

```
app
├── channels
│   └── application_cable
│       ├── channel.rb
│       └── connection.rb
│
├── controllers
│   ├── application_controller.rb
│   ├── auth_controller.rb
│   ├── categories_controller.rb
│   ├── comments_controller.rb
│   ├── forum_threads_controller.rb
│   ├── search_controller.rb
│   └── users_controller.rb
│
├── jobs
│   └── application_job.rb
│
├── mailers
│   └── application_mailer.rb
│
├── models
│   ├── application_record.rb
│   ├── category.rb
│   ├── comment.rb
│   ├── concerns
│   ├── forum_thread.rb
│   └── user.rb
│
├── serializers
│   ├── categories_serializer.rb
│   ├── category_serializer.rb
│   ├── comments_serializer.rb
│   ├── forum_threads_serializer.rb
│   └── individual_forum_serializer.rb
│
└── views
    └── layouts
        ├── mailer.html.erb
        └── mailer.text.erb
```

## More information

Database: PostgreSQL for managing relational data.
