class FriendFinderService

  def initialize(id, topic)
    @member = Member.find(id)
    @topic = topic.downcase!
  end

  def find_friends
    specialists(possible_new_friends(@member))
  end

  def possible_new_friends(member)
    Member.all - member.friends
  end

  def specialists(friends_arr)
    topic = "%#{@topic}%"
    Member.where("scraped_content LIKE ?", topic)
  end
end
