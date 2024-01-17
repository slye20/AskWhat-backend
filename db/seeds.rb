# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Create Users
users = User.create!([
                       { username: 'user1', password: 'password1', email: 'user1@example.com' },
                       { username: 'user2', password: 'password2', email: 'user2@example.com' },
                       { username: 'user3', password: 'password3', email: 'user3@example.com' },
                       { username: 'user4', password: 'password4', email: 'user4@example.com' },
                       { username: 'user5', password: 'password5', email: 'user5@example.com' }
                     ])

# Create Categories
categories = Category.create!([
                                { name: 'General Discussion', description: 'Talk about anything and everything.' },
                                { name: 'Tech Talk', description: 'Discussions about technology and gadgets.' },
                                { name: 'Learning Resources', description: 'Share and discover learning materials.' },
                                { name: 'Health & Wellness',
                                  description: 'Discussions about health, fitness, and well-being.' },
                                { name: 'Travel and Exploration',
                                  description: 'Share travel experiences and adventure stories.' },
                                { name: 'Food & Cuisine',
                                  description: 'Exchange recipes and talk about culinary experiences.' }
                              ])

# Create Forum Threads
forum_threads = ForumThread.create!([
                                      { title: 'Welcome to Our Community Forum', user_id: users[0].id,
                                        content: 'Thanks for joining our forum!' },
                                      { title: 'Favorite Tech Gadgets of 2023', user_id: users[1].id,
                                        content: 'I love the new tech this year.' },
                                      { title: 'Best Online Learning Platforms', user_id: users[2].id,
                                        content: 'Online learning is more accessible than ever.' },
                                      { title: 'Staying Healthy in 2024', user_id: users[3].id,
                                        content: 'Tips and tricks for a healthy lifestyle.' },
                                      { title: 'Must-Visit Destinations this Year', user_id: users[4].id,
                                        content: 'Share your travel plans and ideas.' },
                                      { title: 'Homemade Recipes for Beginners', user_id: users[0].id,
                                        content: 'Easy and delicious recipes for everyone.' },
                                      { title: 'Sustainable Living and Technology', user_id: users[3].id,
                                        content: 'Discuss how technology can aid in sustainable living.' },
                                      { title: 'Global Cuisines and Travel Experiences', user_id: users[4].id,
                                        content: 'Share your experiences with food from around the world.' },
                                      { title: 'Fitness Trends and Online Learning', user_id: users[1].id,
                                        content: 'How online platforms are shaping fitness trends.' }
                                    ])

more_posts = Comment.create!([
                               { forum_thread_id: forum_threads[0].id, user_id: users[1].id,
                                 content: 'Glad to be a part of this community!' },
                               { forum_thread_id: forum_threads[0].id, user_id: users[2].id,
                                 content: 'Hello everyone, excited to join in!' },
                               { forum_thread_id: forum_threads[1].id, user_id: users[0].id,
                                 content: 'Tech gadgets are evolving rapidly!' },
                               { forum_thread_id: forum_threads[1].id, user_id: users[2].id,
                                 content: 'Anyone tried the latest VR set?' },
                               { forum_thread_id: forum_threads[2].id, user_id: users[1].id,
                                 content: 'Online courses are a game-changer.' },
                               { forum_thread_id: forum_threads[2].id, user_id: users[0].id,
                                 content: 'I recommend checking out free webinars.' },
                               { forum_thread_id: forum_threads[3].id, user_id: users[1].id,
                                 content: "I started yoga and it's great!" },
                               { forum_thread_id: forum_threads[3].id, user_id: users[2].id,
                                 content: 'Drinking more water changed my life.' },
                               { forum_thread_id: forum_threads[4].id, user_id: users[0].id,
                                 content: 'Planning a trip to Japan!' },
                               { forum_thread_id: forum_threads[4].id, user_id: users[3].id,
                                 content: 'I want to explore the Amazon rainforest.' },
                               { forum_thread_id: forum_threads[5].id, user_id: users[2].id,
                                 content: 'I made an amazing pasta last night!' },
                               { forum_thread_id: forum_threads[5].id, user_id: users[4].id,
                                 content: 'Trying out vegan recipes!' },
                               { forum_thread_id: forum_threads[6].id, user_id: users[0].id,
                                 content: 'Renewable energy tech is fascinating!' },
                               { forum_thread_id: forum_threads[6].id, user_id: users[2].id,
                                 content: 'Looking into solar panels for my home.' },
                               { forum_thread_id: forum_threads[7].id, user_id: users[1].id,
                                 content: 'I tried amazing street food in Thailand!' },
                               { forum_thread_id: forum_threads[7].id, user_id: users[3].id,
                                 content: 'Italian cuisine is my favorite.' },
                               { forum_thread_id: forum_threads[8].id, user_id: users[4].id,
                                 content: 'Virtual fitness classes are so convenient.' },
                               { forum_thread_id: forum_threads[8].id, user_id: users[0].id,
                                 content: 'Yoga tutorials online helped me a lot.' }
                             ])

ForumThread.first.category << Category.first
ForumThread.second.category << Category.second
ForumThread.third.category << Category.third
ForumThread.find_by(title: 'Staying Healthy in 2024').category << Category.find_by(name: 'Health & Wellness')
ForumThread.find_by(title: 'Must-Visit Destinations this Year').category << Category.find_by(name: 'Travel and Exploration')
ForumThread.find_by(title: 'Homemade Recipes for Beginners').category << Category.find_by(name: 'Food & Cuisine')

ForumThread.find_by(title: 'Sustainable Living and Technology').category << Category.find_by(name: 'Tech Talk')
ForumThread.find_by(title: 'Sustainable Living and Technology').category << Category.find_by(name: 'Health & Wellness')

ForumThread.find_by(title: 'Global Cuisines and Travel Experiences').category << Category.find_by(name: 'Travel and Exploration')
ForumThread.find_by(title: 'Global Cuisines and Travel Experiences').category << Category.find_by(name: 'Food & Cuisine')

ForumThread.find_by(title: 'Fitness Trends and Online Learning').category << Category.find_by(name: 'Learning Resources')
ForumThread.find_by(title: 'Fitness Trends and Online Learning').category << Category.find_by(name: 'Health & Wellness')
