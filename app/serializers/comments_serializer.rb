# CategoriesSerializer converts Category model instances into JSON representations with
# specific attributes for use in the application's responses.
#
# Attributes:
# - author: The username of the comment's author.
# - id: The unique identifier of the comment.
# - content: The content of the comment.
# - created_at: The timestamp indicating when the comment was created.
class CommentsSerializer < ActiveModel::Serializer
  attributes :author, :id, :content, :created_at

  def author
    object.user.username
  end
end
