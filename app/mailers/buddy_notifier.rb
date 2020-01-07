class FriendNotifier < ApplicationMailer
  def inform(user, buddy)
    @user = user
    mail(to: buddy, subject: "#{user.name} has added you as a buddy!")
  end
end
