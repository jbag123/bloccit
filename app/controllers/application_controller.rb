class ApplicationController < ActionController::Base
  before_action :set_csrf_token, if: :valid_get_request?
  include SessionsHelper

  private

  def valid_get_request?
    protect_against_forgery? && !request.xhr? && request.get?
  end

  def set_csrf_token
    cookies[:csrf_token] = {
      value: form_authenticity_token,
      expires: 5.minutes.from_now,
      secure: false
    }
  end
  include SessionsHelper
end
