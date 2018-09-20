class Admin::PotsController < Admin::AdminController
  def index
    @pots = Pot.all
  end

  def edit
    @pot = Pot.find(params[:id])
  end

  def update
    @pot = Pot.find(params[:id])
    if @pot.update(pot_params)
      redirect_to admin_pots_path, notice: 'Pot successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @pot = Pot.find(params[:id])
    @pot.destroy
    redirect_to admin_pots_path, notice: 'Pot successfully deleted!'
  end

  def new
    @pot = Pot.new
  end

  def create
    @pot = Pot.create(pot_params)
    if @pot.valid?
      redirect_to admin_pots_path, notice: 'Pot successfully created!'
    else
      render :new
    end
  end

  private

  def pot_params
    params.require(:pot).permit(:name, :dimensions, :material, :price, :image, :capacity)
  end
end
