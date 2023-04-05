class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :parti, :description, :user_url, :category, :discount, :female_director

end
