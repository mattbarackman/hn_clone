helpers do
  def created_ago(time)
    minutes = ((Time.now() - time) % 3600 / 60).round
    hours = ((Time.now() - time) / 3600).floor
    
    if hours < 1
      "#{minutes} minutes ago"
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

  def user_post_votes(user)
    user.posts_votes.inject(0){|total, post_vote | total += post_vote.vote }
  end

  def user_comment_votes(user)
    user.comments_votes.inject(0){|total, comment_vote | total += comment_vote.vote }  
  end

  def post_votes(post)
    post.posts_votes.inject(0){|total, post_vote | total += post_vote.vote }
  end

  def comment_votes(comment)
    comment.comments_votes.inject(0){|total, comment_vote | total += comment_vote.vote }  
  end

  def username_with_points
    "#{current_user.username} (#{current_user.total_karma})"
  end

  def post_details(post)
    str = ""
    str += post_votes(post).to_s
    str += " points by "
    str += post.user.username
    str += " "
    str += created_ago(post.created_at)
    str += " | "
    str += post.comments.count.to_s 
    str += " comments" 
  end
end