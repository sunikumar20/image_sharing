class HomeController < ApplicationController
  layout 'admin'

  def index
  	@images = Image.all.order("created_at desc").limit(25)
  end
end