class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :published, :user_id, :created_at, :updated_at
  has_one :user
end
