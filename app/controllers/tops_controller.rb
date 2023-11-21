class TopsController < ApplicationController
  def index; end
  def terms; end
  def privacy; end

  def ranking
    @user_ranking = User.joins(:progresses)
    .where(progresses: { status: Progress.statuses[:correct] })
    .group(:id)
    .order(Arel.sql('COUNT(progresses.id) DESC'))
    .select('users.*, COUNT(progresses.id) AS correct_progress_count')
  end
end
