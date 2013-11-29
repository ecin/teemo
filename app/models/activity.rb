require "textacular/searchable"

class Activity < ActiveRecord::Base
  extend Searchable(:name)

  has_and_belongs_to_many :users

  validates_presence_of :name

  def as_json(*args)
    Serializer.new(self).as_json(*args)
  end

  class Serializer < ActiveModel::Serializer
    root false
    attributes :name
  end
end
