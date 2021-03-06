# frozen_string_literal:true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_admin!
end
