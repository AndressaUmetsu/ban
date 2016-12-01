require 'test_helper'

class EmpregadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empregado = empregados(:one)
  end

  test "should get index" do
    get empregados_url
    assert_response :success
  end

  test "should get new" do
    get new_empregado_url
    assert_response :success
  end

  test "should create empregado" do
    assert_difference('Empregado.count') do
      post empregados_url, params: { empregado: { nome: @empregado.nome } }
    end

    assert_redirected_to empregado_url(Empregado.last)
  end

  test "should show empregado" do
    get empregado_url(@empregado)
    assert_response :success
  end

  test "should get edit" do
    get edit_empregado_url(@empregado)
    assert_response :success
  end

  test "should update empregado" do
    patch empregado_url(@empregado), params: { empregado: { nome: @empregado.nome } }
    assert_redirected_to empregado_url(@empregado)
  end

  test "should destroy empregado" do
    assert_difference('Empregado.count', -1) do
      delete empregado_url(@empregado)
    end

    assert_redirected_to empregados_url
  end
end
