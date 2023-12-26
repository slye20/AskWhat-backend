class ForumThreadsSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :description, :created_at
  
  def description
    object.posts.first.content[0...50]
  end

  def author
    object.user.username
  end
end
