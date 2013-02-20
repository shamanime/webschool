require 'spec_helper'

describe "coordenadores/new" do
  before(:each) do
    assign(:coordenador, stub_model(Coordenador,
      :nome => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new coordenador form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => coordenadores_path, :method => "post" do
      assert_select "input#coordenador_nome", :name => "coordenador[nome]"
      assert_select "input#coordenador_email", :name => "coordenador[email]"
    end
  end
end
