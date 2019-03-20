defmodule PhoenixHotelWeb.Router do
  use PhoenixHotelWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixHotelWeb do
    pipe_through :browser

    get "/home/:hotel", HomeController, :hotel
    get "/home", HomeController, :home
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixHotelWeb do
  #   pipe_through :api
  # end
end
