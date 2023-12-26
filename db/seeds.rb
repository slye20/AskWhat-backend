# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

threads = [
  {
    title: "Welcome to Our Community Forum",
    user_id: 1, # Assuming a user with ID 1 exists
    category_id: 1 # Assuming a category with ID 1 exists
  },
  {
    title: "Tips for Effective Online Learning",
    user_id: 2,
    category_id: 2 # Assuming a category with ID 2 exists
  },
  {
    title: "Upcoming Webinar on Web Development",
    user_id: 3,
    category_id: 3 # Assuming a category with ID 3 exists
  }
]

threads.each do |thread|
  ForumThread.create!(thread)
end
