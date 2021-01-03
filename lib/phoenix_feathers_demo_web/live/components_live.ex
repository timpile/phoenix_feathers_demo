defmodule PhoenixFeathersDemoWeb.ComponentsLive do
  use PhoenixFeathersDemoWeb, :live_view

  alias PhoenixFeathers.Icon

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> assign(icon_color: "#222")}
  end
end
