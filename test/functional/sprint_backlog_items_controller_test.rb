require File.dirname(__FILE__) + '/../test_helper'
require 'sprint_backlog_items_controller'

# Re-raise errors caught by the controller.
class SprintBacklogItemsController; def rescue_action(e) raise e end; end

class SprintBacklogItemsControllerTest < Test::Unit::TestCase
  def setup
    @controller = SprintBacklogItemsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
