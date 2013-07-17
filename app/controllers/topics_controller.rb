class TopicsController < ApplicationController

  hobo_model_controller

  auto_actions :all, except: :new
  
  web_method :move_higher
  web_method :move_lower

end
