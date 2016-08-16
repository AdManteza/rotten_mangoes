class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.errors.any?
      render :new
    else
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully"
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :poster, :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description
    )
  end
end


