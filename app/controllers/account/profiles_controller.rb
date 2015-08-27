module Account
  class ProfilesController < ApplicationController
    before_action :set_bricooler, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    skip_after_action :verify_authorized


    def show
    end

    def edit
      # profile
    end

    def update
      if @bricooler.update(bricooler_params)
      redirect_to account_profile_path
      else
        render :edit
      end
    end

    def destroy
      @bricooler.destroy
      redirect_to home_index
    end

    def profile
      # @profile = current_user.profileable
    end

  private

    def set_bricooler
      @bricooler = current_user.profileable
    end

    def bricooler_params
      params.require(:bricooler).permit(:first_name, :last_name, :phone, :bio, :address, :city, :zipcode, user_attributes: [ :id, :email, :password, :password_confirmation ])
    end

  end
end