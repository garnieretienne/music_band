require 'test_helper'

class PublicationTest < ActiveSupport::TestCase
  
  test "publication content is writted in markdown and should be compiled into HTML using to_html" do
    my_publication = Publication.new title: "My new publication", content: "# Hello World"
    assert_equal "<h1>Hello World</h1>\n", my_publication.to_html
  end
end
