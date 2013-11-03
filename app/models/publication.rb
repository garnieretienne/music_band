class Publication < ActiveRecord::Base

  # Convert the publication markdown content into HTML
  def to_html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    markdown.render(content).html_safe
  end
end
