class FriendFinderService

  def find_friends(id, topic)
    @member = Member.find(id)
    @non_friends = possible_new_friends(@member)
    specialists(@non_friends, topic.downcase)
  end

  def possible_new_friends(member)
    Member.where.not(id: member.id) - member.friends
  end

  def specialists(friends_arr, top)
    topic = "%#{top}%"
    Member.where("scraped_content LIKE ?", topic)
  end
end
