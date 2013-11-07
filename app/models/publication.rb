class Publication < ActiveRecord::Base

  # Manage thumbnail image file
  has_attached_file :thumbnail,
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml")

  # Convert the publication markdown content into HTML
  def to_html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    html = markdown.render(content)
    html = markdown_extention_youtube_links(html)
    return html.html_safe
  end

  private

  # Markdown extention: replace every youtube links with embedded youtube video
  def markdown_extention_youtube_links(html)
    html = html.gsub /<a\shref="http:\/\/www\.youtube\.com\/watch\?v=(.*).*".*>.*<\/a>/o, 
      "<p><iframe class=\"youtube-player\" src=\"http://www.youtube.com/embed/\\1\"></iframe></p>"
    return html
  end
end
