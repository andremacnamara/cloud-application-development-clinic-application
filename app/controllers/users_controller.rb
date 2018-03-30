class UsersController < Clearance::UsersController

private
  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)
    clinicAddresss = user_params.delete(:clinicAddresss)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
      user.clinicAddresss = clinicAddresss
  end
  end

end