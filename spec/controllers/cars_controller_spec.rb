# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsController, type: :controller do

  describe "GET #index" do
    it "return http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "return http success" do
      get :new
      assert_response :success
    end
  end

  test 'should get create' do
    get cars_create_url
    assert_response :success
  end

  test 'should get delete' do
    get cars_delete_url
    assert_response :success
  end

  test 'should get edit' do
    get cars_edit_url
    assert_response :success
  end

  test 'should get update' do
    get cars_update_url
    assert_response :success
  end

  test 'should get delete' do
    get cars_delete_url
    assert_response :success
  end

end
