# IndividualForumSerializer converts ForumThread model instances into JSON representations with
# specific attributes for use in the application's responses.
#
# Attributes:
# - thread: An object representing the forum thread with specific attributes.
# - - id: The unique identifier of the forum thread.
# - - author: The username of the forum thread's author.
# - - title: The title of the forum thread.
# - - content: A shortened version of the forum thread's content (limited to the first 50 characters).
# - - created_at: The timestamp indicating when the forum thread was created.
# - - categories: An array of category names associated with the forum thread, sorted in ascending order.
# - comments: An array of comments associated with the forum thread, serialized using CommentsSerializer.
class IndividualForumSerializer < ActiveModel::Serializer
  attributes :thread
  has_many :comments, serializer: CommentsSerializer

  def thread
    {
      id: object.id,
      author: object.user.username,
      title: object.title,
      content: object.content,
      created_at: object.created_at,
      categories:
    }
  end

  def categories
    object.category.map do |category|
      category.name
    end
  end

  def comments
    object.comments.order(:created_at)
  end
end
