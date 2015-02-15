class DogsController <ApplicationController
  before_action :set_dog, :only [:name, :breed, :owner]
  def index
    @dogs= Dog.all
  end

  def new
    @dog= Dog.new
  end

  def create
    @dog= Dog.new(dog_params)
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @dog.update
      redirect_to dogs_path
    else
      render :edit
    end
  end

  def destroy
    @dog.destroy
  end

  private

  def set_dog
    @dog=Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :owner)
  end

end
