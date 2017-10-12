class Friendship < ApplicationRecord
  belongs_to :member
  belongs_to :friend, class_name: "Member"

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverse, if: :has_inverse?

  def create_inverse
    Friendship.create(inverse_params)
  end

  def destroy_inverse
    inverse.destroy
  end

  def has_inverse?
    Friendship.exists?(inverse_params)
  end

  def inverse
    Friendship.where(inverse_params)[0]
  end

  def inverse_params
    { friend_id: member_id, member_id: friend_id }
  end
end
