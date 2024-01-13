class IndividualForumSerializer < ActiveModel::Serializer
  attributes :thread
  has_many :comments, serializer: CommentsSerializer

   def thread
    {
      id: object.id,
      author: object.user.username,
      title: object.title,
      content: object.content,
      categories: categories,
      created_at: object.created_at
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
