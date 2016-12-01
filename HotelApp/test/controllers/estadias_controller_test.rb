require 'test_helper'

class EstadiasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estadias = estadias(:one)
  end

  test "should get index" do
    get estadias_url
    assert_response :success
  end

  test "should get new" do
    get new_estadias_url
    assert_response :success
  end

  test "should create estadias" do
    assert_difference('Estadia.count') do
      post estadias_url, params: { estadias: { cliente_id: @estadias.cliente_id, dataCheckIn: @estadias.dataCheckIn, dataCheckOut: @estadias.dataCheckOut, hotel_id: @estadias.hotel_id, quarto_id: @estadias.quarto_id } }
    end

    assert_redirected_to estadias_url(Estadia.last)
  end

  test "should show estadias" do
    get estadias_url(@estadias)
    assert_response :success
  end

  test "should get edit" do
    get edit_estadias_url(@estadias)
    assert_response :success
  end

  test "should update estadias" do
    patch estadias_url(@estadias), params: { estadias: { cliente_id: @estadias.cliente_id, dataCheckIn: @estadias.dataCheckIn, dataCheckOut: @estadias.dataCheckOut, hotel_id: @estadias.hotel_id, quarto_id: @estadias.quarto_id } }
    assert_redirected_to estadias_url(@estadias)
  end

  test "should destroy estadias" do
    assert_difference('Estadia.count', -1) do
      delete estadias_url(@estadias)
    end

    assert_redirected_to estadias_url
  end
end
