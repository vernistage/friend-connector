class FriendFinderService

  def find_friends(id, topic)
    @member = Member.find(id)
    @non_friends = search_friends(@member, topic.downcase)
  end

  def search_friends(member, top)
    topic = "%#{top}%"
    Member.where.not(id: member.id).where("scraped_content LIKE ?", topic) - member.friends
  end

  def possible_new_friends(member)
    Member.where.not(id: member.id) - member.friends
  end
end
