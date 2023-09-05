class MindeeExtractor
  attr_reader :extractor_hash

  def initialize(filepath)
    @filepath = filepath
  end

  def perform
    call_api
    invoice_number
    total_amount
    invoice_emission_date
    invoice_due_date
    company
    construct_hash
  end

  private

  def call_api
    mindee_client = Mindee::Client.new(api_key: ENV["MINDEE_URL"])
    input_source = mindee_client.source_from_path(@filepath)
    @result = mindee_client.parse(
      input_source,
      Mindee::Product::Invoice::InvoiceV4
    )
    @doc_result = @result.document.inference.pages.first.prediction
  end

  def invoice_number
    @invoice_number_f = @doc_result.invoice_number.value
  end

  def total_amount
    @total_amount = @doc_result.total_amount.value
  end

  def invoice_emission_date
    @invoice_emission_date = @doc_result.date.value
  end

  def invoice_due_date
    @invoice_due = @doc_result.due_date.value
  end

  def company
    @invoice_company_name = @doc_result.customer_name.value
  end

  def construct_hash
    @extractor_hash = {
      number: @invoice_number_f,
      amount: @total_amount,
      emission_date: @invoice_emission_date,
      due_date: @invoice_due,
      company_name: @invoice_company_name
    }
  end
end
