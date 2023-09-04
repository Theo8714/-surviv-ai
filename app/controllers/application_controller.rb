class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :new_invoice

  def new_invoice
    @invoice_new = Invoice.new
  end
end
