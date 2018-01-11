require 'test_helper'

class FlashcardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @token = TokiToki.encode(@user.login)
    @flashcard = @user.flashcards.first
  end



  it "gets index" do
    get flashcards_url
    value(response).must_be :success?
  end

  test 'should create flashcard' do
    assert_difference('Flashcard.count') do
      post flashcards_url, params: {
        token: @token,
        flashcard: {
          answer: @flashcard.answer,
          question: @flashcard.question,
          user_id: @flashcard.user_id
        }
      }, as: :json
    end

    assert_response 201
  end


  test 'should show flashcard' do
    get flashcard_url(@flashcard), params: {
      token: @token
    }
    assert_response :success
  end

  # it "shows flashcard" do
  #   get flashcard_url(flashcard)
  #   value(response).must_be :success?
  # end

  it "updates flashcard" do
    patch flashcard_url(flashcard), params: { flashcard: { answer: flashcard.answer, question: flashcard.question, user_id: flashcard.user_id } }
    value(response.status).must_equal 200
  end

  it "destroys flashcard" do
    expect {
      delete flashcard_url(flashcard)
    }.must_change "Flashcard.count", -1

    value(response.status).must_equal 204
  end
end
