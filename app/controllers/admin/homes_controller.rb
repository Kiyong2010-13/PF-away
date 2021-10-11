class Admin::HomesController < ApplicationController
    before_action :authenticate_admin!
    def top
        @customers =Customer.all
        @posts = Customer.page(params[:page]).per(10)
    end
end
