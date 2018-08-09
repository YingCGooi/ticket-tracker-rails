class TicketsControllerTest < ActionDispatch::IntegrationTest
  test 'should get tickets' do
    get tickets_url
    assert_response :success
  end
end