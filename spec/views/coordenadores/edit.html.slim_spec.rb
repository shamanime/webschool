require 'spec_helper'

describe "coordenadores/edit" do
  before(:each) do
    @coordenador = assign(:coordenador, stub_model(Coordenador,
      :nome => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit coordenador form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => coordenadores_path(@coordenador), :method => "post" do
      assert_select "input#coordenador_nome", :name => "coordenador[nome]"
      assert_select "input#coordenador_email", :name => "coordenador[email]"
    end
  end
end
