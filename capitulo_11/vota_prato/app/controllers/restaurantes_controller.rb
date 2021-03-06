class RestaurantesController < ApplicationController
  def index

    #render "index"

    @restaurantes = Restaurante.order :nome
    respond_to do |format|
      format.html
      format.xml {render xml: @restaurantes}
      format.json {render json: @restaurantes}
    end
  end
  def show
    @restaurante = Restaurante.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @restaurante}
      format.xml {render xml: @restaurante}
    end
  end
  def destroy
    @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy
    redirect_to(action: "index")
  end
  def new
    @restaurante = Restaurante.new
  end
  def restaurante_params
    params.require(:restaurante).permit(:nome, :endereco, :especialidade)
  end
  def create
    @restaurante = Restaurante.new(restaurante_params)
    #@restaurante.save
    #redirect_to action: "show", id: @restaurante
    if @restaurante.save
      redirect_to action: "show", id: @restaurante
    else
      render action: "new"
    end
  end
  def edit
    @restaurante = Restaurante.find params[:id]
  end
  def update
    @restaurante = Restaurante.find(params[:id])
    #@restaurante.update_attributes(restaurante_params)
    #redirect_to action: "show", id: @restaurante
    if @restaurante.update_attributes(restaurante_params)
      redirect_to action: "show", id: @restaurante
    else
      render action: "edit"
    end
  end
end
