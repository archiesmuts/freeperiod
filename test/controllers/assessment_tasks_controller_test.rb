require 'test_helper'

class AssessmentTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assessment_task = assessment_tasks(:one)
  end

  test "should get index" do
    get assessment_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_assessment_task_url
    assert_response :success
  end

  test "should create assessment_task" do
    assert_difference('AssessmentTask.count') do
      post assessment_tasks_url, params: { assessment_task: { assessment_type_id: @assessment_task.assessment_type_id, name: @assessment_task.name, slug: @assessment_task.slug } }
    end

    assert_redirected_to assessment_task_url(AssessmentTask.last)
  end

  test "should show assessment_task" do
    get assessment_task_url(@assessment_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_assessment_task_url(@assessment_task)
    assert_response :success
  end

  test "should update assessment_task" do
    patch assessment_task_url(@assessment_task), params: { assessment_task: { assessment_type_id: @assessment_task.assessment_type_id, name: @assessment_task.name, slug: @assessment_task.slug } }
    assert_redirected_to assessment_task_url(@assessment_task)
  end

  test "should destroy assessment_task" do
    assert_difference('AssessmentTask.count', -1) do
      delete assessment_task_url(@assessment_task)
    end

    assert_redirected_to assessment_tasks_url
  end
end
