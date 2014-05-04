class SongsController < ApplicationController

  def index
    @songs = Song.all
    @song = Song.new
  end

  def create
    # Song.new(params[:song])

    @song = Song.new(song_params.merge(user_id: current_user.id))
    
    respond_to do |format|
      if @song.save
        format.html { redirect_to :root, notice: "Save process completed!" }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { 
          flash.now[:notice]="Save proccess coudn't be completed!" 
          render :new 
        }
        format.json { render json: @song.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @song = Song.find(params[:id])
    # @song.destroy
    respond_to do |format|
      if @song.destroy
        format.html { redirect_to :root, notice: "Save process completed!" }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { 
          flash.now[:notice]="Save proccess coudn't be completed!" 
          render :new 
        }
        format.json { render json: @song.errors, status: :unprocessable_entity}
      end
    end



    
    # redirect_to users_path 
  end

  protected

  def song_params
    params.permit(
      :soundcloud_track_id, :title, :duration, :room_id
      )
  end

end


