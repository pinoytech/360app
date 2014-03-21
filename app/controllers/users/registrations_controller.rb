class Users::RegistrationsController < Devise::RegistrationsController
  def update
    successfully_updated = if needs_password?(params)
                             current_user.update_attributes(user_params)
                           else
                             params[:user].delete(:password)
                             current_user.update_without_password(user_params)
                           end

    if successfully_updated
      sign_in(current_user, bypass: true)
      flash[:notice] = 'Account was successfully updated.'
    else
      flash[:alert] = "#{current_user.errors.full_messages.join('<br>')}"
    end

    respond_to do |format|
      format.js
      format.html {redirect_to :back}
    end
  end

  private
  def needs_password?(params)
    !params[:user][:password].blank?
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :job_title)
  end
end