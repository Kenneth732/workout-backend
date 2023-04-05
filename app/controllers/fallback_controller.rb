# class FallbackController < ApplicationController
# end
class FallbackController < ActionController::Base
    def index
      render file: 'public/index.html'
    end
end