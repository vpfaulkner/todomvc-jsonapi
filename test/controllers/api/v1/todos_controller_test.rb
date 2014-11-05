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

  context "POST #create" do

    should "Assign correct todo" do
      post :create, {title: "get bread", order: 1, completed: false}

      assert_response :success
      assert assigns[:todo].persisted?
      assert_equal assigns[:todo].title, "get bread"
    end

    should "give bad response with improper attributes" do
      post :create, {title: "", order: 1, completed: false}

      assert_response :bad_request
      refute assigns[:todo].persisted?
    end
  end

  context "PUT #update" do
    should "not be able to find new todo" do
      assert_nil Todo.find_by(:title => "new todo")
    end

    should "respond with ok to put request" do
      put :update, {id: todos(:one).id, title: "new todo", order: 1, completed: false}

      assert_response :success
      assert Todo.find_by(:title => "new todo")
    end

    should "respond with bad request if bad put request" do
      put :update, {id: todos(:one).id, title: "", order: 1, completed: false}

      assert_response :bad_request
      refute Todo.find_by(:title => "new todo")
    end

  end

end
