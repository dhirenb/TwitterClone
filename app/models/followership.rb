class Followership < ActiveRecord::Base
  attr_accessible :followed_id

  # Conencts two of the same class type.
  # We have to assign names and type explicitly
  belongs_to :follower, :class_name => "User"
  belongs_to :followed, :class_name => "User"


  # TODO: Validates both IDs!!!
end
