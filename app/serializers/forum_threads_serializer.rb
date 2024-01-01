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
