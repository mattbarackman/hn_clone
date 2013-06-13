# Add helpers here as *.rb files, e.g.,

# app/helpers/formatting.rb

# helpers do
#   def em(text)
#     "<em>#{text}</em>"
#   end
# end

helpers do
  def created_ago(time)
    hours_decimal = (Time.now() - time)/3600
    hours = hours_decimal.round
    if hours < 1
      "in the past hour."
    elsif hours == 1
      "an hour ago."
    elsif hours < 24
      "#{hours} hours ago."
    else
      "more than a day ago."
    end
  end
end