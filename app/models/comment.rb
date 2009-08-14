class Comment < ActiveRecord::Base
validates_presence_of :body, :shownuser
belongs_to :post
end
