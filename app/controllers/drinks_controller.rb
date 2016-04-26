class DrinksController < OpenReadController
  before_action :set_drink, only: [:update, :destroy] # it matters who created the drink

  # GET /drinks
  # GET /drinks.json
  def index
    @drinks = Drink.all

    render json: @drinks
  end

  # GET /drinks/1
  # GET /drinks/1.json
  def show
    @drink = Drink.find(params[:id]);
    render json: @drink
  end

  # POST /drinks
  # POST /drinks.json
  def create

    if current_user.admin?
      @drink = current_user.stores.find(params[:store_id]).drinks.build(drink_params)
      @drink.user_id = current_user.id

      if @drink.save
        render json: @drink, status: :created, location: @drink
      else
        render json: @drink.errors, status: :unprocessable_entity
      end

    else
      head :bad_request
    end
  end

  # PATCH/PUT /drinks/1
  # PATCH/PUT /drinks/1.json
  def update
    @drink.update(drink_params)
    if @drink.valid?
      head :no_content
    else
      render json: @drink.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drinks/1
  # DELETE /drinks/1.json
  def destroy
    @drink.destroy
    if @drink.destroyed?
      head :no_content
    else
      render json: @drink.errors, status: :unprocessable_entity
    end
  end

  private

    def set_drink
      @drink = current_user.drinks.find(params[:id])
    end

    def drink_params
      params.require(:drinks).permit(:name, :ingredients, :toppings, :notes, :store_id)
    end
end
