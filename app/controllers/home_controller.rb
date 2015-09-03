class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized

  def index
  end

  def about
  end
end
