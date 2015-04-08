module ProfilesHelper

  def show_rating_for profile
    if profile.rating.nil?
      content_tag(:h5, "Not rated yet", :class=>'orange text-center rating')
    else
      content_tag(:h5, "Rating: #{profile.rating}", :class=>'orange text-center rating')
    end
  end
end
