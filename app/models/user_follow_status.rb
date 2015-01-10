class UserFollowStatus < Status
  belongs_to :followee, class_name: User
end
