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
    @users = User.where(user_type: 2)
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages
  # POST /packages.json
  def create
    long, width, height = params[:package][:size].split('x')
    @package = Package.new(package_params)
    @package.value = calculate_price(long.to_f, width.to_f, height.to_f, params[:package][:weight].to_f, params[:package][:fragile], params[:package][:express])
    @package.code = generate_code(@package)

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        @users = User.where(user_type: 2)
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

  def checking
    @package = Package.find_by(id: params[:pid])
    if @package.state == 0
      @package.state = 1 #enviado
    end
    @package.checked_in.push(params[:cid]) if !@package.checked_in.include?(params[:cid])
    course = Course.find_by(id: @package.course_id)
    if course.route['r'].length == @package.checked_in.length+1
      @package.state = 3
    end

    respond_to do |format|
      if @package.save
          format.html { redirect_to @package, notice: 'Package was successfully updated.' }
      else
        format.html { render @package, notice: 'No se puede guardar' }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  def calculate
    long, width, height = params[:size].split('x')
    weight = params[:weight]
    fragile = params[:checked]
    express = params[:express]
    @price = calculate_price(long.to_f, width.to_f, height.to_f, weight.to_f, fragile, express)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:fragility, :size, :weight, :conveyance, :shipping_date, :delivery_date, :observations, :user_id, :receiver_id, :course_id)
    end

    def calculate_price(long, width, height, weight, fragile, express)
      price = weight/(((long * width * height)/5000) * 1000)
      price = price + (price/2) if fragile == 'true'
      price = price + 5 if express == 'true'
      total = (price * 6.96).round(2)
    end

    def generate_code(package)
      hash = Hashids.new("eul_salt")
      hash = hash.encode(package.user_id,
                         package.receiver_id,
                         package.container_id,
                         package.weight,
                         package.conveyance,
                         (package.fragility ? 1 : 0),
                         (package.express ? 1 : 0),
                         package.value)
    end
end
