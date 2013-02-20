# encoding: utf-8
class CoordenadoresController < ApplicationController
  def index
    @coordenadores = CoordenadorDecorator.decorate_collection(Coordenador.all)
  end

  def show
    @coordenador = CoordenadorDecorator.new(Coordenador.find(params[:id]))
  end

  def new
    @coordenador = Coordenador.new
  end

  def edit
    @coordenador = Coordenador.find(params[:id])
  end

  def create
    @coordenador = Coordenador.new(params[:coordenador])
    respond_to do |format|
      if @coordenador.save
        format.html { redirect_to @coordenador, :flash => { :success => 'Coordenador cadastrado com sucesso.' } }
        format.json { render json: @coordenador, status: :created, location: @coordenador }
      else
        format.html { render action: "new" }
        format.json { render json: @coordenador.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @coordenador = Coordenador.find(params[:id])

    if params[:coordenador][:password].blank?
      [:password, :password_confirmation].collect{ |p| params[:coordenador].delete(p) }
    end

    respond_to do |format|
      if @coordenador.update_attributes(params[:coordenador])
        format.html { redirect_to @coordenador, :flash => { :success => 'Coordenador atualizado com sucesso.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coordenador.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coordenador = Coordenador.find(params[:id])
    if current_coordenador == @coordenador
      redirect_to coordenadores_path, :flash => { :error =>  'Não é possivel excluir seu próprio cadastro!' }
    else
      @coordenador.destroy
      redirect_to coordenadores_path, :flash => { :success =>  'Coordenador excluido.' }
    end
  end
end
