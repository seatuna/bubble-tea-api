class AdminsController < ProtectedController
  before_action :set_admin, only: [:show, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all

    render json: @admins
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    render json: @admin
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      render json: @admin, status: :created, location: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    @admin = Admin.find(params[:id])

    if @admin.update(admin_params)
      head :no_content
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy

    head :no_content
  end

  private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params[:admin]
    end
end
