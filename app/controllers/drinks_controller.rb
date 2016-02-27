class DrinksController < ProtectedController
  before_action :set_drink, only: [:show, :update, :destroy]

  # GET /drinks
  # GET /drinks.json
  def index
    @drinks = Drink.all

    render json: @drinks
  end

  # GET /drinks/1
  # GET /drinks/1.json
  def show
    render json: @drink
  end

  # POST /drinks
  # POST /drinks.json
  def create
    @drink = Store.find(params[:store_id]).drinks.build(drink_params) # need to 

    if @drink.save
      render json: @drink, status: :created, location: @drink
    else
      render json: @drink.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /drinks/1
  # PATCH/PUT /drinks/1.json
  def update
    @drink = Drink.find(params[:id])

    if @drink.update(drink_params)
      head :no_content
    else
      render json: @drink.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drinks/1
  # DELETE /drinks/1.json
  def destroy
    @drink.destroy

    head :no_content
  end

  private

    def set_drink
      @drink = Drink.find(params[:id])
    end

    def drink_params
      params.require(:drinks).permit(:name, :ingredients, :toppings, :notes, :store_id)
    end
end
