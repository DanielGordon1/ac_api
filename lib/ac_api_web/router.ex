defmodule AcApiWeb.Router do
  use AcApiWeb, :router

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

  scope "/api", AcApiWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end

  scope "/", AcApiWeb do
    pipe_through :api

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", AcApiWeb do
  #   pipe_through :api
  # end
end
