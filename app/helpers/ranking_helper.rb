module RankingHelper
  def ranking_row_height(index)
    case index
    when 0
      'height: 175px;'
    when 1, 2
      'height: 140px;'
    else
      'height: 110px;'
    end
  end
end
