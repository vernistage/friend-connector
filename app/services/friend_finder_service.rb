class FriendFinderService

  def find_friends(id, topic)
    @member = Member.find(id)
    @topic = topic.downcase!
    specialists(possible_new_friends(@member))
  end

  def possible_new_friends(member)
    Member.where.not(id: member.id) - member.friends
  end

  def specialists(friends_arr)
    topic = "%#{@topic}%"
    Member.where("scraped_content LIKE ?", topic)
  end
end
