module PostsHelper
  def resize_image_links(post, user)
    links = []

    if post.has_medium?
      links << link_to("M", post.medium_file_url, :id => "medium-file-link")
    end
    
    if post.has_large?
      links << link_to("L", post.large_file_url, :id => "large-file-link")
    end
    
    if post.has_medium? || post.has_large?
      links << link_to("O", post.file_url, :id => "original-file-link")
    end
    
    if links.any?
      content_tag("span", raw("Resize: " + links.join(" ")))
    else
      nil
    end
  end
end
