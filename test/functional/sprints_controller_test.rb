require File.dirname(__FILE__) + '/../test_helper'
require 'sprints_controller'

# Re-raise errors caught by the controller.
class SprintsController; def rescue_action(e) raise e end; end

class SprintsControllerTest < Test::Unit::TestCase
  fixtures :sprints

  def setup
    @controller = SprintsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:sprints)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_sprint
    old_count = Sprint.count
    post :create, :sprint => { }
    assert_equal old_count+1, Sprint.count
    
    assert_redirected_to sprint_path(assigns(:sprint))
  end

  def test_should_show_sprint
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_sprint
    put :update, :id => 1, :sprint => { }
    assert_redirected_to sprint_path(assigns(:sprint))
  end
  
  def test_should_destroy_sprint
    old_count = Sprint.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Sprint.count
    
    assert_redirected_to sprints_path
  end
end
