class StaticSitesController < ApplicationController
  before_filter :no_access
  before_filter :no_one!, only: :show_files
  def index
  end

  def about
  end

  def contact
  end

  def show_files
    if params[:path] == "root"
      @path = "Root"
      @range = -1
      @files = Dir["public/*"]
    else
      @path = params[:path]
      @path = @path.gsub("-", "/")
      @range = @path.length
      @files = Dir["public/#{@path}/*"]
    end
  end

  private

  def no_one!
    unless user_signed_in? && current_user.admin?
      flash[:error] = "You have no power here!"
      redirect_to root_path
    end
  end
end
