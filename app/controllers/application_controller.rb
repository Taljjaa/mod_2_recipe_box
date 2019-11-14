class ApplicationController < ActionController::Base
    before_action :set_current_user

    def not_found
        raise ActionController::RoutingError.new('Not Found')
    rescue
        render_404
    end

    def render_404
        render file: "#{Rails.root}/public/404", status: :not_found
      end

    private 

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end
end
