class UserController < ApplicationController
    before_action :authencate_user!
end
