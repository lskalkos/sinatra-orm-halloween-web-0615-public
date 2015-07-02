class Kid < ActiveRecord::Base
  has_one :bucket
  has_many :candies, through: :bucket

  def pig_out(amount)
    amount.times do
        self.candies.last.destroy
        self.save
    end
    amount <= 2 ? self.feeling = "Happy" : self.feeling = "Sick"
    self.save
  end

end