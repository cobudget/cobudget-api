class UserMailer < ActionMailer::Base
  def invite_email(user, inviter, group, tmp_password)
    @user = user
    @inviter = inviter
    @tmp_password = tmp_password
    @group = group
    mail(to: user.name_and_email,
        from: inviter.name_and_email,
        subject: "#{inviter.name} invited you to join \"#{group.name}\" on Cobudget")
  end

  def invite_to_group_email(user, inviter, group, round)
    @user = user
    @inviter = inviter
    @group = group
    @round = round
    mail(to: user.name_and_email,
        from: inviter.name_and_email,
        subject: "#{inviter.name} invited you to join \"#{group.name}\" on Cobudget")
  end

  def invite_to_propose_email(user, inviter, group, round)
    @user = user
    @group = group
    @round = round
    mail(to: user.name_and_email,
        from: inviter.name_and_email,
        subject: "Come propose buckets for \"#{round.name}\" in \"#{group.name}\" on Cobudget!")
  end

  def invite_to_contribute_email(user, inviter, group, round)
    @user = user
    @group = group
    @round = round
    @allocation_amount = round.allocations.find_by(user_id: user.id).formatted_amount
    mail(to: user.name_and_email,
        from: inviter.name_and_email,
        subject: "Come fund buckets for \"#{round.name}\" in \"#{group.name}\" on Cobudget!")
  end

  def round_closed_email(user, sender, group, round)
    @group = group
    @round = round
    mail(to: user.name_and_email,
        from: sender.name_and_email,
        subject: "#{round.name} in #{group.name}")
  end
end