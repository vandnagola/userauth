module ArticlesHelper
   def display_attached_file(article)
    return content_tag(:p, "No file attached.") unless article.file.attached?

    if article.file.content_type.start_with?('image/')
      safe_join([
        link_to(image_tag(article.file, width: 540, height: 300), url_for(article.file)),
        content_tag(:p, link_to("Download File", download_article_path(article)))
      ])
    elsif article.file.content_type.start_with?('video/')
      video_tag(url_for(article.file), controls: true, loop: true, width: 640, height: 360)
    elsif article.file.content_type.start_with?('audio/')
      audio_tag(url_for(article.file), controls: true, muted: true)
    else
      content_tag(:p, "Unsupported file type.")
    end
  end
end
