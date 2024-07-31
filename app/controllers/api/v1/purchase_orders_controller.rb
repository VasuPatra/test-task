module Api
  module V1
    class PurchaseOrdersController < ApplicationController
      before_action :set_purchase_order, only: %i[ show update destroy ]

      def index
        @purchase_orders = PurchaseOrder.all
      end

      def show; end

      def create
        @purchase_order = PurchaseOrder.new(purchase_order_params)

        if @purchase_order.save
          render :show, status: :created, location: @purchase_order
        else
          render json: @purchase_order.errors, status: :unprocessable_entity
        end
      end

      def update
        if @purchase_order.update(purchase_order_params)
          render :show, status: :ok, location: @purchase_order
        else
          render json: @purchase_order.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @purchase_order.destroy!

        head :no_content
      end

       def report
        purchase_orders = ReportService.new(report_params).call
        render json: purchase_orders, include: [:vendor, :user, :items]
      end

      private

      def set_purchase_order
        @purchase_order = PurchaseOrder.find(params[:id])
      end

      def purchase_order_params
        params.require(:purchase_order).permit(:order_number, :vendor_id, :status, :user_id, :remarks,
                                                :created_at, :updated_at)
      end

      def report_params
        params.permit(:start_date, :end_date, :user_id, :category_id, :vendor_id, :status)
      end
    end
  end
end
