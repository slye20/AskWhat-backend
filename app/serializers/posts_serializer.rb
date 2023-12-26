class PostsSerializer < ActiveModel::Serializer
  attributes :id, :author, :content, :created_at

  def author
    object.user.username
  end

end
