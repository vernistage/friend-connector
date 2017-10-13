class FriendConnectionsService

  def find_pathway(poss_friends, member, possible_friend)
    queue = Queue.new
    friend_path = [member]
    new_path = Array.new
    queue.enq(friend_path)
    while(!queue.empty?)
      current_path = queue.deq
      current_node_member = current_path[current_path.length-1]
      break if current_node_member == possible_friend
      current_node_member.friends.each do |friend|
        if !current_path.include?(friend)
          new_path = friend_path + [friend]
          queue.enq(new_path)
        end
      end
    end
    new_path << possible_friend
  end
end
