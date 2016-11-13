class PackagesController < ApplicationController
  layout 'dashboard'
  before_action :validate_user
  before_action :set_package, only: [:show, :edit, :update, :destroy]

  # GET /packages
  # GET /packages.json
  def index
    @packages = Package.all
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
  end

  # GET /packages/new
  def new
    @package = Package.new
    @users = User.where(user_type_id: UserType.find_by(title: 'Cliente').id)
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages
  # POST /packages.json
  def create
    long, width, height = params[:package][:size].split('x')
    @package = Package.new(package_params)
    @package.value = calculate_price(long.to_f, width.to_f, height.to_f, params[:package][:weight].to_f, params[:package][:fragile])
    @package.code = generate_code(@package)
    # @package.container_id = calculate_container(@package.size, @package.weight, @package.fragility)

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calculate
    long, width, height = params[:size].split('x')
    weight = params[:weight]
    fragile = params[:checked]
    @price = calculate_price(long.to_f, width.to_f, height.to_f, weight.to_f, fragile)
    # render json: {total: }, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:fragility, :size, :weight, :value, :conveyance, :shipping_date, :delivery_date, :observations, :user_id, :receiver_id)
    end

    def calculate_price(long, width, height, weight, fragile)
      price = weight/(((long * width * height)/5000) * 1000)
      price = price + (price/2) if fragile == 'true'
      total = (price * 6.96).round(2)
    end

    def calculate_container(size, weight, fragile)
      long, width, height = size.split('x')
      vol_weight = (long * width * height)/5000
      if weight < 1 and fragile == 0
        #Create container and add it if not exist
      else
        return 0
      end
    end

    def generate_code(package)
      hash = Hashids.new("eul_salt")
      hash = hash.encode(package.user_id,
                         package.receiver_id,
                         package.container_id,
                         package.weight,
                         package.conveyance,
                         package.fragility,
                         package.value)
    end
end
