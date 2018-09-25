class Admin::FlowersController < Admin::AdminController
  def index
    @prompt = 'Sort by...'
    @flowers = Flower.all
    @flowers = @flowers.send(params[:sort]) unless params[:sort].blank?
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
    # @flower.flower_avatar.attach(flower_avatar_params)
    if @flower.valid?
      redirect_to admin_flowers_path, notice: 'Flower successfully created!'
    else
      render :new
    end
  end

  private

  def flower_params
    params.require(:flower).permit(:name, :color, :origin, :price, :image, :avatar)
  end

  def flower_avatar_params
    params.require(:flower).permit(:flower_avatar)
  end
end
