module Account
  class ProfilesController < ApplicationController
    before_action :set_bricooler, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    skip_after_action :verify_authorized


    def show
    end

    def edit
      profile
    end

    def update
      if @bricooler.update(bricooler_params)
      redirect_to account_bricooler_path
      else
        render :edit
      end
    end

    def destroy
      @bricooler.destroy
      redirect_to home_index
    end

    def profile
      @profile = current_user.profileable
    end

    def create_services
      s1 = Service.new(:category => params[:category_detecteur], :name => params[:name_detecteur], :price => params[:price_detecteur])
      s1.bricooler = current_user.profileable
      s1.save

      s2 = Service.new(:category => params[:category_bricolage], :name => params[:name_bricolage], :price => params[:price_bricolage])
      s2.bricooler = current_user.profileable
      s2.save

      s3 = Service.new(:category => params[:category_montage_simple], :name => params[:name_montage_simple], :price => params[:price_montage_simple])
      s3.bricooler = current_user.profileable
      s3.save

      s4 = Service.new(:category => params[:category_montage_moyen], :name => params[:name_montage_moyen], :price => params[:price_montage_moyen])
      s4.bricooler = current_user.profileable
      s4.save

      s5 = Service.new(:category => params[:category_montage_complexe], :name => params[:name_montage_complexe], :price => params[:price_montage_complexe])
      s5.bricooler = current_user.profileable
      s5.save

      s6 = Service.new(:category => params[:category_fixation_simple], :name => params[:name_fixation_simple], :price => params[:price_fixation_simple])
      s6.bricooler = current_user.profileable
      s6.save

      s7 = Service.new(:category => params[:category_fixation_complexe], :name => params[:name_fixation_complexe], :price => params[:price_fixation_complexe])
      s7.bricooler = current_user.profileable
      s7.save

      s8 = Service.new(:category => params[:category_fixation_rideaux], :name => params[:name_fixation_rideaux], :price => params[:price_fixation_rideaux])
      s8.bricooler = current_user.profileable
      s8.save

      s9 = Service.new(:category => params[:category_joints_lavabo], :name => params[:name_joints_lavabo], :price => params[:price_joints_lavabo])
      s9.bricooler = current_user.profileable
      s9.save

      s10 = Service.new(:category => params[:category_joints_douche], :name => params[:name_joints_douche], :price => params[:price_joints_douche])
      s10.bricooler = current_user.profileable
      s10.save

      s11 = Service.new(:category => params[:category_serviette], :name => params[:name_serviette], :price => params[:price_serviette])
      s11.bricooler = current_user.profileable
      s11.save

      s12 = Service.new(:category => params[:category_rideau_douche], :name => params[:name_rideau_douche], :price => params[:price_rideau_douche])
      s12.bricooler = current_user.profileable
      s12.save

      s13 = Service.new(:category => params[:category_pare_douche], :name => params[:name_pare_douche], :price => params[:price_pare_douche])
      s13.bricooler = current_user.profileable
      s13.save

      s14 = Service.new(:category => params[:category_prise], :name => params[:name_prise], :price => params[:price_prise])
      s14.bricooler = current_user.profileable
      s14.save

      s15 = Service.new(:category => params[:category_luminaire], :name => params[:name_luminaire], :price => params[:price_luminaire])
      s15.bricooler = current_user.profileable
      s15.save

      s16 = Service.new(:category => params[:category_pommeau], :name => params[:name_pommeau], :price => params[:price_pommeau])
      s16.bricooler = current_user.profileable
      s16.save

      s17 = Service.new(:category => params[:category_fuite], :name => params[:name_fuite], :price => params[:price_fuite])
      s17.bricooler = current_user.profileable
      s17.save

      s18 = Service.new(:category => params[:category_chassedeau], :name => params[:name_chassedeau], :price => params[:price_chassedeau])
      s18.bricooler = current_user.profileable
      s18.save

      s19 = Service.new(:category => params[:category_robinet], :name => params[:name_robinet], :price => params[:price_robinet])
      s19.bricooler = current_user.profileable
      s19.save

      redirect_to account_services_path
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