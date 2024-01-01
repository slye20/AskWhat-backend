class CommentsSerializer < ActiveModel::Serializer
  attributes :author, :id, :content, :created_at

  def author
    object.user.username
  end
end
