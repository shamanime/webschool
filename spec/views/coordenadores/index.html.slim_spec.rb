require 'spec_helper'

describe "coordenadores/index" do
  before(:each) do
    assign(:coordenadores, [
      stub_model(Coordenador,
        :nome => "Nome",
        :email => "Email"
      ),
      stub_model(Coordenador,
        :nome => "Nome",
        :email => "Email"
      )
    ])
  end

  it "renders a list of coordenadores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
