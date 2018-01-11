require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @token = TokiToki.encode(@user.login)
    @tag = @user.tags.first
  end

  it "gets index" do
    get tags_url
    value(response).must_be :success?
  end

  test 'should create tag' do
    assert_difference('Tag.count') do
      post tags_url, params: {
        token: @token,
        tag: {
          name: 'Some Tag'
        }
      }, as: :json
    end

    assert_response 201
  end

  test 'should show tag' do
    get tag_url(@tag), params: {
      token: @token
    }
    assert_response :success
  end

  # it "creates tag" do
  #   expect {
  #     post tags_url, params: { tag: { name: tag.name, user_id: tag.user_id } }
  #   }.must_change "Tag.count"
  #
  #   value(response.status).must_equal 201
  # end
  #
  # it "shows tag" do
  #   get tag_url(tag)
  #   value(response).must_be :success?
  # end

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
