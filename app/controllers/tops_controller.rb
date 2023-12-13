class TopsController < ApplicationController
  def index; end
  def terms; end
  def privacy; end

  def ranking
    @user_ranking = User.ranking
  end
end
