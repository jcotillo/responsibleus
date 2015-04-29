# class RegistrationsController < Devise::RegistrationsController

# 	def after_sign_in_path_for(user)
# 	  dash_path
# 	end

#   private
#   def sign_up_params
#     params.require(:user).permit(:full_name, :age, :transportation, :neighborhood, :email, :password, :password_confirmation)
#   end

#   def account_update_params
#     params.require(:user).permit(:full_name, :age, :transportation, :neighborhood, :email, :password, :password_confirmation, :current_password)
#   end
  
# end
