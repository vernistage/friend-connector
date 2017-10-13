# == Schema Information
#
# Table name: members
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  website         :string           not null
#  short_url       :string           default(""), not null
#  scraped_content :text             default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Member < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  validates :name, :website, :short_url, :scraped_content, presence: true

  validates :website, uniqueness: true

  def interests_array(str)
    str.split(' | ')
  end
end
