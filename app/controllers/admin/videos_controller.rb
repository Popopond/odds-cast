# app/controllers/admin/videos_controller.rb
class Admin::VideosController < ApplicationController
  before_action :set_video, only: %i[show edit update destroy]

  # GET /admin/videos
  def index
    @videos = Video.all
  end

  # GET /admin/videos/:id
  def show
  end

  # GET /admin/videos/new
  def new
    @video = Video.new
    @video.build_content
  end

  # GET /admin/videos/:id/edit
  def edit
  end

  # POST /admin/videos
  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to admin_video_path(@video), notice: "Video was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/videos/:id
  def update
    if @video.update(video_params)
      redirect_to admin_video_path(@video), notice: "Video was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/videos/:id
  def destroy
    @video.destroy
    redirect_to admin_videos_path, notice: "Video was successfully destroyed."
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :cover, :video_url)
  end
end
