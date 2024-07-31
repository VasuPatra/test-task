module Api
  module V1
    class VendorsController < ApplicationController
      before_action :set_vendor, only: %i[ show update destroy ]

      def index
        @vendors = Vendor.all
      end

      def show; end

      def create
        @vendor = Vendor.new(vendor_params)

        if @vendor.save
          render :show, status: :created, location: @vendor
        else
          render json: @vendor.errors, status: :unprocessable_entity
        end
      end

      def update
        if @vendor.update(vendor_params)
          render :show, status: :ok, location: @vendor
        else
          render json: @vendor.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @vendor.destroy!

        head :no_content
      end

      private
        def set_vendor
          @vendor = Vendor.find(params[:id])
        end

        def vendor_params
          params.require(:vendor).permit(:name, :is_active, :email, :phone, :address, :country, :gstn, :state,
                                         :city, :created_by, :created_at, :updated_at)
        end
    end
  end
end
