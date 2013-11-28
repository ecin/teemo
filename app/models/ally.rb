class Ally < ActiveRecord::Base
  extend Forwardable

  belongs_to :activity
  belongs_to :captain, class_name: "User"
  belongs_to :user

  validates_presence_of :activity, :user, :captain

  alias_method :who, :user

  def_delegators :who, :email, :name
end
