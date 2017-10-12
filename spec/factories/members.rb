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

FactoryGirl.define do
  factory :member do
    name             { Faker::Name.first_name }
    website          { Faker::Internet.url }
    short_url        { Faker::Internet.url }
    scraped_content  { Faker::Lorem.paragraph }
  end
end
