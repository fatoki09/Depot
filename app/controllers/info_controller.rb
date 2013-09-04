class InfoController < ApplicationController
	skip_before_action :authorize
  def home
  end

  def about
  end

  def news
  end

  def contact
  end
end
