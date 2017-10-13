class FriendConnectionsService

  def find_pathway(poss_friends, member, friend)
    queue = Queue.new
    friend_pathway = [member]
    queue.enq(friend_pathway)

  while(!queue.empty?)
    current_path = queue.deq
    #current node is last in queue
    current_node_member = current_path[current_path.length-1]
    #until we find the possible friend
    until current_node_member == possible_friend
      # if current node has friends
      if current_node_member.friends.any?
        #add current node to friend pathway
        friend_pathway << current_node_member
        # go through each friend
        current_node_member.friends.each do |friend|
          # add friend to queue
          queue.enq(friend)
        end
      end
    end
  end
  # return final pathway
  friend_pathway
end
