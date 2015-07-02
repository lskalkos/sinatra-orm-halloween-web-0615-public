class House < ActiveRecord::Base
  has_many :candies

  def unclaimed_candies
    claimed_candies = self.candies.select{|candies| candies.bucket }
    self.candies.delete(claimed_candies)
    self.candies
  end

  def give_candy(kid)
    kid.bucket.candies << self.unclaimed_candies.first unless kid.age >= 18
    kid.save
    kid.age < 18 ? "Happy Halloween!" : "You're too old to trick-or-treat."
  end
end