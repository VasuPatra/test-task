module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_item, only: %i[ show edit update destroy ]

      def index
        @items = Item.all
      end

      def show; end

      def create
        @item = Item.new(item_params)

        if @item.save
          render :show, status: :created, location: @item
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      def update
        if @item.update(item_params)
          render :show, status: :ok, location: @item
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @item.destroy!

        head :no_content
      end

      private
        def set_item
          @item = Item.find(params[:id])
        end

        def item_params
          params.require(:item).permit(:name, :qty, :is_active, :additional_remark, :description, :category_id,
                                       :created_at, :updated_at, :item_code)
        end
    end
  end
end
