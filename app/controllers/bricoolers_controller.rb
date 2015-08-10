class BricoolersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_action :set_bricooler, only: [:index, :show, :edit, :update, :destroy]



  # def find_profileable
  #   params.each do |name, value|
  #     if name =~ /(.+)_id$/
  #       return $1.classify.constantize.find(value)
  #     end
  #   end
  #   nil
  # end

  def index
    # @profileable = find_profileable
    # @bricoolers = @profileable.bricoolers
    @bricoolers = Bricooler.includes(:profileable).all
    raise

  end
  # def index
  #   # resource, id = request.path.split('/')[1, 2]
  #   # bricooler_model = resource.singularize.classify.constantize
  #   # @bricooler = bricooler_model.find(id)
  #   @bricoolers = Bricooler.all
  #   raise

  # end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bricooler
      @bricooler = current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bricooler_params
      params.require(:bricooler).permit(:first_name, :last_name, :address, :city, :zipcode, :profileable_type, :profileable_id)
    end
end
