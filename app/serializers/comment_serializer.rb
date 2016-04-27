class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :current_user

  def current_user
    scope == object.user
  end
end
