class MindeeExtractor
  attr_reader :invoice_number_f

  def perform
    call_api
    invoice_number
    total_amount
    invoice_emission_date
    invoice_due_date
  end

  private

  def call_api
      mindee_client = Mindee::Client.new(api_key: ENV["MINDEE_URL"])
      input_source = mindee_client.source_from_path("/Users/theochatonnet/Desktop/PANOPLI 2.pdf")
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
      @invoice_due_date = @doc_result.due_date.value
    end
    # company_name = @doc_result.customer_name.value
end
