class Night < ActiveRecord::Base

  def count_up
    self.count += 1
    self
  end

  def count_down
    self.count -= 1
    self
  end
end
