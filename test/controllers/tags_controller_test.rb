require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  let(:tag) { tags :one }

  it "gets index" do
    get tags_url
    value(response).must_be :success?
  end

  it "creates tag" do
    expect {
      post tags_url, params: { tag: { name: tag.name, user_id: tag.user_id } }
    }.must_change "Tag.count"

    value(response.status).must_equal 201
  end

  it "shows tag" do
    get tag_url(tag)
    value(response).must_be :success?
  end

  it "updates tag" do
    patch tag_url(tag), params: { tag: { name: tag.name, user_id: tag.user_id } }
    value(response.status).must_equal 200
  end

  it "destroys tag" do
    expect {
      delete tag_url(tag)
    }.must_change "Tag.count", -1

    value(response.status).must_equal 204
  end
end
