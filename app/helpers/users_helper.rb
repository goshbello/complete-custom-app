module UsersHelper

  # Method to get user profile image from gravatar
  def gravatar_for(user, size: 100)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    # gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}" # to increase image size use the code below instead
    gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class:"gravatar") # note we will use the class to style the image
  end
end

