class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :email, :password, :password_confirmation

  validates_uniqueness_of :email

  has_many :posts, :dependent => :destroy

  #TODO: Add destruction dependences in all these!

  has_many :followerships, :foreign_key => "follower_id"

  has_many :reverse_followerships, :foreign_key => "followed_id", :class_name => "Followership"

  has_many :following, :through => :followerships, :source => :followed

  has_many :followers, :through => :reverse_followerships,
                       :source  => :follower

  def following?(to_follow)
    followerships.find_by_follower_id(to_follow)
  end

  def follow(to_follow)
    followerships.create(:followed_id => to_follow.id)
  end

  def unfollow(to_not_follow)
    # Double check that we're actually following before doing anything
    if following?(to_not_follow)
      followerships.find_by_follower_id(to_not_follow).destroy
    end
  end
end
