class ReportService
  def initialize(params)
    @params = params
  end

  def call
    PurchaseOrder.all
                 .by_start_date(@params[:start_date])
                 .by_end_date(@params[:end_date])
                 .by_user(@params[:user_id])
                 .by_category(@params[:category_id])
                 .by_vendor(@params[:vendor_id])
                 .by_status(@params[:filter_by_status])
  end
end
