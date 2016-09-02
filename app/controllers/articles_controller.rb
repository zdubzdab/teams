class ArticlesController < ApplicationController
  def index
    @users = User.all
  end
end
