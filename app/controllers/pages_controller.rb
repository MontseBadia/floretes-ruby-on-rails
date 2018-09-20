class PagesController < ApplicationController
  before_action :require_admin, only: [:privileges]
  
  def home
  end

  def privileges
  end
end
