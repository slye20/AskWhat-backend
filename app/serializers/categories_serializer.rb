# CategoriesSerializer converts Category model instances into JSON representations with 
#specific attributes for use in the application's responses.
#
# Attributes:
# - name: The name of the category.
class CategoriesSerializer < ActiveModel::Serializer
  attributes :name
end
