class ItemPicturesController < ApplicationController
  before_action :set_item_picture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction


  # GET /item_pictures
  # GET /item_pictures.json
  def index
    if current_user.explicit?
      # Show all items including the ones marked explicit
      @item_pictures = ItemPicture.all
      @heading = "Picture Records [E*]"

      # search Id
      @search = params["search"]

      if @search.present?

        @search_term = @search["name"]

        @item_pictures = ItemPicture.where("name ILIKE ?", "%#{@search_term}%")
      end

      @item_pictures = @item_pictures.paginate(page: params[:page], :per_page => 200)
                   .order(sort_column + " " + sort_direction)

      render action: :index

    else
      # Show only items not marked as explicit
      @item_pictures = ItemPicture.all
      @heading = "Picture Records [S*]"

      # search Id
      @search = params["search"]

      if @search.present?

        @search_term = @search["name"]

        @item_pictures = ItemPicture.where("name ILIKE ?", "%#{@search_term}%")

      end
      @item_pictures = @item_pictures.where(explicit: false).paginate(page: params[:page], :per_page => 200)
                   .order(sort_column + " " + sort_direction)

      render action: :index

    end

  end
  # GET /item_pictures/1
  # GET /item_pictures/1.json
  def show
  end

  # GET /item_pictures/new
  def new
    @item_picture = ItemPicture.new
  end

  # GET /item_pictures/1/edit
  def edit
  end

  # POST /item_pictures
  # POST /item_pictures.json
  def create
    @item_picture = ItemPicture.create(item_picture_params)
  end

  # PATCH/PUT /item_pictures/1
  # PATCH/PUT /item_pictures/1.json
  def update
    respond_to do |format|
      if @item_picture.update(item_picture_params)
        format.html { redirect_to @item_picture, notice: 'Item picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_picture }
      else
        format.html { render :edit }
        format.json { render json: @item_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_pictures/1
  # DELETE /item_pictures/1.json
  def destroy
    @item_picture.destroy
    respond_to do |format|
      format.html { redirect_to item_pictures_url, notice: 'Item picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_picture
      @item_picture = ItemPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_picture_params
      params.require(:item_picture).permit(:name, :description, :author, :educational, :relevant, :q, :s, :notes, :picture, :explicit)
    end


    def sort_column
      ItemPicture.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
