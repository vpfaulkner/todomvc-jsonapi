require 'test_helper'

class Api::V1::TodosControllerTest < ActionController::TestCase
  context "GET #index" do
    setup do
      get :index, {}
    end

    should respond_with(:ok)

    should "Return todos" do
      assert assigns[:todos]
      assert_equal assigns[:todos][0].title, todos(:one).title
    end

  end

  context "Post #create" do
    setup do
      post :create, {title: "get bread", order: 1, completed: false}
    end

    should respond_with(:created)

    should "Assign correct todo" do
      assert assigns[:todo]
      assert_equal assigns[:todo].title, "get bread"
    end

  end
end
