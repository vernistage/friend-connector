module MembersHelper

  def current_user
    Member.all.last
  end
end
