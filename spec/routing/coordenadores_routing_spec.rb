require "spec_helper"

describe CoordenadoresController do
  describe "routing" do

    it "routes to #index" do
      get("/coordenadores").should route_to("coordenadores#index")
    end

    it "routes to #new" do
      get("/coordenadores/new").should route_to("coordenadores#new")
    end

    it "routes to #show" do
      get("/coordenadores/1").should route_to("coordenadores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/coordenadores/1/edit").should route_to("coordenadores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/coordenadores").should route_to("coordenadores#create")
    end

    it "routes to #update" do
      put("/coordenadores/1").should route_to("coordenadores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/coordenadores/1").should route_to("coordenadores#destroy", :id => "1")
    end

  end
end
