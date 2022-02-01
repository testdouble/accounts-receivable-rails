require "rails_helper"

RSpec.describe "Invoices", type: :request do
  let!(:first_invoice) { create :invoice }
  let!(:second_invoice) { create :invoice }

  describe "get /invoices" do
    subject { get invoices_path }

    it "renders index" do
      subject

      expect(response).to render_template(:index)
      expect(response.body).to include(first_invoice.client.name)
      expect(response.body).to include(second_invoice.client.name)
    end
  end

  describe "get /invoices/:id" do
    let!(:service) { create :service, price_cents: 100 }
    let!(:line_item) { create :line_item, invoice: first_invoice, service: }

    subject { get invoice_path(first_invoice) }

    it "renders show" do
      subject

      expect(response).to render_template(:show)
      expect(response.body).to include(first_invoice.client.name)
      expect(response.body).to include(first_invoice.line_items.first.service.name)
    end
  end

  describe "get /invoices/new" do
    subject { get new_invoice_path }

    it "renders new" do
      subject
      expect(response).to render_template(:new)
    end
  end

  describe "post /invoices" do
    let!(:client) { create :client }

    subject { post invoices_path, params: {invoice: {client_id: client.id}} }

    it "creates a new invoice" do
      subject

      expect(response).to redirect_to(assigns(:invoice))
      follow_redirect!
      expect(response.body).to include("Invoice was successfully created.")
    end
  end

  describe "put /invoices/:id" do
    let!(:client) { create :client }

    subject { put invoice_path(first_invoice), params: {invoice: {client_id: client.id}} }

    it "updates the invoice" do
      subject

      expect(response).to redirect_to(assigns(:invoice))
      follow_redirect!
      expect(response.body).to include("Invoice was successfully updated.")
    end
  end

  describe "delete /invoices/:id" do
    subject { delete invoice_path(first_invoice) }

    it "destroys the invoice" do
      subject

      expect(response).to redirect_to(invoices_path)
      follow_redirect!
      expect(response.body).to include("Invoice was successfully destroyed.")
    end
  end
end
