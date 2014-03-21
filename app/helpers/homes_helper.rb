module HomesHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def welcome(user)
    name = user.full_name.blank? ? user.email : user.full_name.titleize
    "Welcome #{name}!"
  end
end