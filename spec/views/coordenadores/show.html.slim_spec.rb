require 'spec_helper'

describe "coordenadores/show" do
  before(:each) do
    @coordenador = assign(:coordenador, stub_model(Coordenador,
      :nome => "Nome",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Email/)
  end
end
