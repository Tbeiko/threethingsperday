class Post < ActiveRecord:Base
	validate_presence_of :title

belongs_to :user



end