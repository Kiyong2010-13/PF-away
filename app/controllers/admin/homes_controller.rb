class Admin::HomesController < ApplicationController
    def top
        @customers =Customer.all
        @posts = Customer.page(params[:page]).per(10)
    end
end
