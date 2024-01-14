# CategorySerializer converts Category model instances into JSON representations with
# specific attributes for use in the application's responses.
#
# Attributes:
# - id: The unique identifier of the category.
# - name: The name of the category.
# - description: A brief description of the category.
class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description
end
