module Api
  module V1
    class FoodsController < ApplicationController

      def index
        restaurants = Restaurant.find(params[:restaurant_id])
        foods = restaurants.foods

        render json: {
          foods: foods
        }, status: :ok
      end

    end
  end
end
