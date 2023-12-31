require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      title: "MyString",
      content: "MyContent"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do
      assert_select "input[name=?]", "article[title]"

      # TODO: with rich_text, this is not a textarea
      # assert_select "textarea[name=?]", "article[content]"
    end
  end
end
