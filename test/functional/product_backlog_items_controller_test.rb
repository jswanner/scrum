require File.dirname(__FILE__) + '/../test_helper'
require 'product_backlog_items_controller'

# Re-raise errors caught by the controller.
class ProductBacklogItemsController; def rescue_action(e) raise e end; end

class ProductBacklogItemsControllerTest < Test::Unit::TestCase
  def setup
    @controller = ProductBacklogItemsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
