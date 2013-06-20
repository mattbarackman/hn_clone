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
end