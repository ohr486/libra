defmodule Libra do
  use Application

  # OTP application
  def start(_type, _args) do
    Libra.Supervisor.start_link
  end

end
