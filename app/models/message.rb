class Message < ActiveRecord::Base
  has_many :comments
  attr_accessible :content, :tags
  validates_presence_of :content
end
