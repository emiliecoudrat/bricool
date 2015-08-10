class BricoolersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
