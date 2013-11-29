class User < ActiveRecord::Base
  has_secure_password

  has_and_belongs_to_many :activities
  has_many :allies, foreign_key: :captain_id

  validates_presence_of :email, :name

  class Serializer < ActiveModel::Serializer
    root false
    attributes :email, :name
  end

end
