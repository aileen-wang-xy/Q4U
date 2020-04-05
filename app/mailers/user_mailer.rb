class UserMailer < ApplicationMailer
    default from: 'notifications@queue4u.herokuapp.com'
 
    def welcome_email
      @user = params[:user]
      @url  = 'https://queue4u.herokuapp.com/user/sign_in'
      mail(to: @user.email, subject: 'Welcome to Q4U Site')
    end

    def collect_email
      @user = params[:user]
      @url  = 'https://queue4u.herokuapp.com/user/sign_in'
      mail(to: @user.email, subject: 'Deal collected on Q4U Site')
    end

end