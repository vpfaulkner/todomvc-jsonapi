require 'test_helper'

class Api::V1::TodosControllerTest < ActionController::TestCase
  context "GET #index" do
    setup do
      get :index, {}
    end

    should respond_with(:ok)

    should "Return todos" do
      assert assigns[:todos]
    end

  end
end
