class DrinksController < OpenReadController
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

    if current_user.admin?
      @drink = current_user.stores.find(params[:store_id]).drinks.build(drink_params)
      @drink.user_id = current_user.id
      @drink.save
        render json: @drink, status: :created, location: @drink
    else
      render json: @drink.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /drinks/1
  # PATCH/PUT /drinks/1.json
  def update
    if current_user.admin?
      @drink = current_user.drinks.find(params[:id])
      @drink.update(drink_params)
      head :no_content
    else
      render json: @drink.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drinks/1
  # DELETE /drinks/1.json
  def destroy
    if current_user.admin? && current_user.id == @drink.user_id
      @drink.destroy
      head :no_content
    else
      render json: @drink.errors, status: :unprocessable_entity
    end
  end

  private

    def set_drink
      @drink = Drink.find(params[:id])
    end

    def drink_params
      params.require(:drinks).permit(:name, :ingredients, :toppings, :notes, :store_id, :user_id)
    end
end
