class Admin::FlowersController < Admin::AdminController
  def index
    @flowers = Flower.all
  end

  def edit
    @flower = Flower.find(params[:id])
  end

  def update
    @flower = Flower.find(params[:id])
    if @flower.update(flower_params)
      redirect_to admin_flowers_path, notice: 'Flower successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @flower = Flower.find(params[:id])
    @flower.destroy
    redirect_to admin_flowers_path, notice: 'Flower successfully deleted!'
  end

  def new
    @flower = Flower.new
  end

  def create
    @flower = Flower.create(flower_params)
    if @flower.valid?
      redirect_to admin_flowers_path, notice: 'Flower successfully created!'
    else
      render :new
    end
  end

  private

  def flower_params
    params.require(:flower).permit(:name, :color, :origin, :price, :image)
  end
end
