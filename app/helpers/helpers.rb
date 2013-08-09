helpers do
  def created_ago(time)
    hours_decimal = (Time.now() - time)/3600
    hours = hours_decimal.round
    if hours < 1
      "in the past hour"
    elsif hours == 1
      "1 hour ago"
    elsif hours < 24
      "#{hours} hours ago"
    elsif hours < 48
      "1 day ago"
    else
      "#{hours / 24} days ago" 
    end
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id] 
  end

  def username_with_points
    "#{current_user.username} (#{current_user.total_karma})"
  end

end