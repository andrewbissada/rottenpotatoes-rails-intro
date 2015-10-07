class MoviesController < ApplicationController

  # See Section 4.5: Strong Parameters below for an explanation of this method:
  # http://guides.rubyonrails.org/action_controller_overview.html
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    #@movie = Movie.find(id) # look up movie by unique ID
    @movie = Movie.find(params[:id]) + " " + params[:direction]
    # will render app/views/movies/show.<extension> by default
    #if params[:sort] == "title"
    #  @title = "hilite"
   # elsif params[:sort] == "release_date"
    #  @release_date = "hilite"
    #end
      
  end

  def index
    #@movies = Movie.all
    @movies = Movie.order(params[:sort])
    if(params[:sort] == "title")
      @sort = "title"
    end
    if (params[:sort]=="release_date")
      @sort = "release_date"
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private :movie_params
  
end
