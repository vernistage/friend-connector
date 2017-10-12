class Friendship < ApplicationRecord
  belongs_to :member
  belongs_to :friend, class_name: "Member"

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    Friendship.create(inverse_params)
  end

  def destroy_inverses
    inverses.destroy
  end

  def has_inverse?
    Friendship.exists?(inverse_params)
  end

  def inverses
    Friendship.where(inverse_params)
  end

  def inverse_params
    { friend_id: member_id, member_id: friend_id }
  end
end
