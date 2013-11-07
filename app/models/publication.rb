class Publication < ActiveRecord::Base

  # Manage thumbnail image file
  has_attached_file :thumbnail,
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml")

  # Convert the publication markdown content into HTML
  def to_html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    markdown.render(content).html_safe
  end
end
