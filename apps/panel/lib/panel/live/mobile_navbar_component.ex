defmodule Panel.MobileNavbarLinkComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <%= live_redirect @name, to: @path,
      class: is_active(@id, @module)
    %>
    """
  end

  defp is_active(id, module) do
    if id == module do
      "block px-3 py-2 rounded-md text-base font-medium text-white bg-gray-900 focus:outline-none focus:text-white focus:bg-gray-700"
    else
      "mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700"
    end
  end
end
