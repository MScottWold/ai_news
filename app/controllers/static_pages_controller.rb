class StaticPagesController < ApplicationController
  def root
    render :root
  end

  def about
    render :about
  end

  def privacy
    render :privacy
  end
end 