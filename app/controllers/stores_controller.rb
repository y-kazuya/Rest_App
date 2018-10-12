class StoresController < ApplicationController

  def top
  end

  def index

  end

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
    @store.store_images.build
    @store.tags.build
  end

  def create
    @store = Store.new(store_params)
    n =[]
    @store.tags.each do |tag|
      if Tag.find_by(name: tag.name) == nil
        n << tag
      else
        n << Tag.find_by(name: tag.name)
      end
    end
    @store.tags = []
    n.each do |t|
      @store.tags << t
    end

    if @store.save
      redirect_to store_path(@store)
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def store_params
    params.require(:store).permit(
      :name,
      :cate,
      :ken,
      :adrres,
      :profile,
      :owner_id,
      :working_time,
      holiday_ids: [],
      store_images_attributes: [:image, :status],
      tags_attributes: [:name]
    )
  end
end
