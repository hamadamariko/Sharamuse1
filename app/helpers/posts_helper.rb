module PostsHelper
  def find_youtube_url(youtube_url)
    if youtube_url.include?("https://youtu.be/")
      youtube_url.strip!.gsub("https://youtu.be/", "")
    else
      youtube_url.strip!.gsub("https://www.youtube.com/watch?v=", "")
    end
  end
end
