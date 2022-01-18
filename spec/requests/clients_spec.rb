require "rails_helper"

RSpec.describe "Clients", type: :request do
  let!(:first_client) { create :client }
  let!(:second_client) { create :client }

  describe "get /clients" do
    subject { get clients_path }

    it "renders index" do
      subject

      expect(response).to render_template(:index)
      expect(response.body).to include(first_client.name)
      expect(response.body).to include(second_client.name)
    end
  end

  describe "get /clients/new" do
    subject { get new_client_path }

    it "renders new" do
      subject
      expect(response).to render_template(:new)
    end
  end

  describe "post /clients" do
    let(:new_client) { build :client }

    subject { post clients_path, params: { client: {name: new_client.name, email: new_client.email }}}

    it "creates a new client" do
      subject

      expect(response).to redirect_to(assigns(:client))
      follow_redirect!
      expect(response.body).to include("Client was successfully created.")
    end
  end

  describe "put /clients/:id" do
    let(:new_client) { build :client }

    subject { put client_path(first_client), params: { client: {name: new_client.name, email: new_client.email }}}

    it "updates the client" do
      subject

      expect(response).to redirect_to(assigns(:client))
      follow_redirect!
      expect(response.body).to include("Client was successfully updated.")
    end
  end

  describe "delete /clients/:id" do
    subject { delete client_path(first_client) }

    it "destroys the client" do
      subject

      expect(response).to redirect_to(clients_path)
      follow_redirect!
      expect(response.body).to include("Client was successfully destroyed.")
    end
  end
end