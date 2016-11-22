class UserService

  def initialize(user, client = nil)
    @user = user
    @client = client
  end

  def update_user_organizations
    organizations = @client.orgs(@user.nickname)

    organizations.each { |github_org|
      room = RoomService.new(nil, @client).find_and_update_room(github_org)
      @user.rooms.push(room) if !@user.rooms.include? room
    }
  end

end