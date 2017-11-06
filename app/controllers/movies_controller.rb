class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: movies.as_json(except: [:created_at, :updated_at]), status: :ok
  end

  def show
    movie = Movie.find_by(id: params[:id])

    if movie
      render json: movie.as_json(except: [:created_at, :udpated_at]), status: :ok
    else
      render json: { ok: false }, status: :not_found
    end
  end

  def create
    movie = Movie.create(movies_params)

    if movie.valid?
      render json: movie.as_json(except: [:created_at, :updated_at]), status: :created
    else
      render json: { errors: movie.errors.messages }, status: :bad_request
    end
  end

  private

    def movies_params
      return params.require(:movie).permit(:title, :overview, :release_date, :inventory)
    end
end
