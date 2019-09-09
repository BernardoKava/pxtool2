class ItemVideosController < ApplicationController
  before_action :set_item_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction

  # GET /item_videos
  # GET /item_videos.json
  def index
    if current_user.explicit?
      # Show all items including the ones marked explicit
      @item_videos = ItemVideo.all
      @heading = "Video Records [E*]"

      # search Id
      @search = params["search"]

      if @search.present?

        @search_term = @search["name"]

        @item_videos = ItemVideo.where("name ILIKE ?", "%#{@search_term}%")
      end

      @item_videos = @item_videos.paginate(page: params[:page], :per_page => 50)
                   .order(sort_column + " " + sort_direction)
      render action: :index

    else
      # Show only items not marked as explicit
      @item_videos = ItemVideo.all
      @heading = "Video Records [S*]"

      # search Id
      @search = params["search"]

      if @search.present?

        @search_term = @search["name"]

        @item_videos = ItemVideo.where("name ILIKE ?", "%#{@search_term}%")

      end
      @item_videos = @item_videos.where(explicit: false).paginate(page: params[:page], :per_page => 50)
                   .order(sort_column + " " + sort_direction)
      render action: :index

    end


  end
  # GET /item_videos/1
  # GET /item_videos/1.json
  def show
  end

  # GET /item_videos/new
  def new
    @item_video = ItemVideo.new
  end

  # GET /item_videos/1/edit
  def edit
  end

  # POST /item_videos
  # POST /item_videos.json
  def create
    @item_video = ItemVideo.create(item_video_params)
  end

  # PATCH/PUT /item_videos/1
  # PATCH/PUT /item_videos/1.json
  def update
    respond_to do |format|
      if @item_video.update(item_video_params)
        format.html { redirect_to @item_video, notice: 'Item video was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_video }
      else
        format.html { render :edit }
        format.json { render json: @item_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_videos/1
  # DELETE /item_videos/1.json
  def destroy
    @item_video.destroy
    respond_to do |format|
      format.html { redirect_to item_videos_url, notice: 'Item video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_video
      @item_video = ItemVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_video_params
      params.require(:item_video).permit(:name, :description, :author, :educational, :relevant, :q, :s, :notes, :picture, :explicit)
    end

    def sort_column
      ItemVideo.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
