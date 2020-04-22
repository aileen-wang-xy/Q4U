class UserMailer < ApplicationMailer
    default from: 'notifications@queue4u.herokuapp.com'

    def collector_email
      @user = params[:user]
      @creator = params[:creator]
      @url  = 'https://queue4u.herokuapp.com/user/sign_in'
      mail(to: @user.email, subject: 'Made a deal on Q4U Site')
    end

    def creator_email
      @user = params[:user]
      @collector = params[:collector]
      @url  = 'https://queue4u.herokuapp.com/user/sign_in'
      mail(to: @user.email, subject: 'Your post was collected on Q4U Site')
    end

end