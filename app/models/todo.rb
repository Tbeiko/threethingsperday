class Todo < ActiveRecord::Base
# validates_presence_of :title
  belongs_to :user

  def before_create
    self.created_at = Time.now
    self.updated_at = Time.now
  end

  def created_today?
    self.created_at.today?
  end
end