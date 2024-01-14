# ForumThreadsSerializer converts ForumThread model instances into JSON representations with
# specific attributes for use in the application's responses.
#
# Attributes:
# - id: The unique identifier of the forum thread.
# - author: The username of the forum thread's author.
# - title: The title of the forum thread.
# - content: A shortened version of the forum thread's content (limited to the first 50 characters).
# - created_at: The timestamp indicating when the forum thread was created.
# - categories: An array of category names associated with the forum thread, sorted in ascending order.
class ForumThreadsSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :content, :created_at, :categories

  def content
    object.content[0...50]
  end

  def author
    object.user.username
  end

  def categories
    object.category.order(name: :asc).map do |category|
      category.name
    end
  end
end
