class Post < ActiveRecord::Base
validates_presence_of :body, :shownuser
has_many :comments
acts_as_taggable
end
