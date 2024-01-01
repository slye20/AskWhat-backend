# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Create Users
users = User.create!([
  { username: 'user1', password: 'password1', email: 'user1@example.com' },
  { username: 'user2', password: 'password2', email: 'user2@example.com' },
  { username: 'user3', password: 'password3', email: 'user3@example.com' }
])

# Create Categories
categories = Category.create!([
  { name: 'General Discussion', description: 'Talk about anything and everything.' },
  { name: 'Tech Talk', description: 'Discussions about technology and gadgets.' },
  { name: 'Learning Resources', description: 'Share and discover learning materials.' }
])

# Create Forum Threads
forum_threads = ForumThread.create!([
  { title: 'Welcome to Our Community Forum', user_id: users[0].id , content: 'Thanks for joining our forum!' },
  { title: 'Favorite Tech Gadgets of 2023', user_id: users[1].id, content: 'I love the new tech this year.' },
  { title: 'Best Online Learning Platforms', user_id: users[2].id, content: 'Online learning is more accessible than ever.'}
])

more_posts = Comment.create!([
  { forum_thread_id: forum_threads[0].id, user_id: users[1].id, content: 'Glad to be a part of this community!' },
  { forum_thread_id: forum_threads[0].id, user_id: users[2].id, content: 'Hello everyone, excited to join in!' },
  { forum_thread_id: forum_threads[1].id, user_id: users[0].id, content: 'Tech gadgets are evolving rapidly!' },
  { forum_thread_id: forum_threads[1].id, user_id: users[2].id, content: 'Anyone tried the latest VR set?' },
  { forum_thread_id: forum_threads[2].id, user_id: users[1].id, content: 'Online courses are a game-changer.' },
  { forum_thread_id: forum_threads[2].id, user_id: users[0].id, content: 'I recommend checking out free webinars.' }
])

ForumThread.first.category << Category.first
ForumThread.second.category << Category.second
ForumThread.third.category << Category.third