class Task < ActiveRecord::Base
  validates :name, presence: true
  after_create :set_done_false

private

  def set_done_false
    self.update({:done => false})
  end

end
