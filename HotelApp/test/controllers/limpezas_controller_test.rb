require 'test_helper'

class LimpezasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @limpeza = limpezas(:one)
  end

  test "should get index" do
    get limpezas_url
    assert_response :success
  end

  test "should get new" do
    get new_limpeza_url
    assert_response :success
  end

  test "should create limpeza" do
    assert_difference('Limpeza.count') do
      post limpezas_url, params: { limpeza: { data: @limpeza.data, hora: @limpeza.hora } }
    end

    assert_redirected_to limpeza_url(Limpeza.last)
  end

  test "should show limpeza" do
    get limpeza_url(@limpeza)
    assert_response :success
  end

  test "should get edit" do
    get edit_limpeza_url(@limpeza)
    assert_response :success
  end

  test "should update limpeza" do
    patch limpeza_url(@limpeza), params: { limpeza: { data: @limpeza.data, hora: @limpeza.hora } }
    assert_redirected_to limpeza_url(@limpeza)
  end

  test "should destroy limpeza" do
    assert_difference('Limpeza.count', -1) do
      delete limpeza_url(@limpeza)
    end

    assert_redirected_to limpezas_url
  end
end
