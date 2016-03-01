class StoresController < OpenReadController
  before_action :set_store, only: [:show, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all

    render json: @stores
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    render json: @store
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    if @store.save
      render json: @store, status: :created, location: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    @store = Store.find(params[:id])

    if @store.update(store_params)
      head :no_content
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy

    head :no_content
  end

  private

    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params[:store]
    end
end
