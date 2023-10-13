# frozen_string_literal: true
class MenusController < ApplicationController
  def index
    menus = Menu.all

    if params[:sort] == 'low_to_high_price'
        menus = menus.order(price: :asc)
    elsif params[:sort] == 'high_to_low_price'
        menus = menus.order(price: :desc)
    end

    if params[:search]
      search_term = "%#{params[:search]}%"
      menus = menus.where('name ILIKE ?', search_term)
    end

    render json: menus
  end
end