defmodule Libra.Counter do

  def inc(key, opts \\ []) do
    add(key, 1, opts)
  end

  def add(key, val, opts \\ []) do
    :ok = :exometer.update_or_create(key, val, :counter, opts)
  end

  def get(key) do
    {:ok, [value: val, ms_since_reset: since]} = :exometer.get_value(key)
    val
  end

end
