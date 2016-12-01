require 'test_helper'

class TipoQuartosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_quarto = tipo_quartos(:one)
  end

  test "should get index" do
    get tipo_quartos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_quarto_url
    assert_response :success
  end

  test "should create tipo_quarto" do
    assert_difference('TipoQuarto.count') do
      post tipo_quartos_url, params: { tipo_quarto: { nome: @tipo_quarto.nome, preco: @tipo_quarto.preco } }
    end

    assert_redirected_to tipo_quarto_url(TipoQuarto.last)
  end

  test "should show tipo_quarto" do
    get tipo_quarto_url(@tipo_quarto)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_quarto_url(@tipo_quarto)
    assert_response :success
  end

  test "should update tipo_quarto" do
    patch tipo_quarto_url(@tipo_quarto), params: { tipo_quarto: { nome: @tipo_quarto.nome, preco: @tipo_quarto.preco } }
    assert_redirected_to tipo_quarto_url(@tipo_quarto)
  end

  test "should destroy tipo_quarto" do
    assert_difference('TipoQuarto.count', -1) do
      delete tipo_quarto_url(@tipo_quarto)
    end

    assert_redirected_to tipo_quartos_url
  end
end
