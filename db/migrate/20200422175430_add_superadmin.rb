class AddSuperadmin < ActiveRecord::Migration[6.0]
  def change
    User.create! do |u|
      u.email     = 'q4youq4you@gmail.com'
      u.password  = 'password'
      u.name = 'Admin'
      u.contact_no = '0874567890'
      u.superadmin_role = true
    end
  end
end
