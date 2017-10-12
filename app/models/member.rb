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
  has_many :friendships
  has_many :friends, through: :friendships
end
