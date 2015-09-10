defmodule Libra.Histogram do

  @default_time_span 60_000
  @default_slot_period 1_000
  @default_module :exometer_slide
  @default_truncate true
  @default_keep_high 0

  def add(key, val, opts \\ default_opts) do
    :ok = :exometer.update_or_create(key, val, :histogram, opts)
  end

  def get(key) do
    {:ok, ret} = :exometer.get_value(key)
    ret
  end

  defp default_opts do
    [
      {:time_span, @default_time_span},
      {:slot_period, @default_slot_period},
      {:histogram_module, @default_module},
      {:truncate, @default_truncate},
      {:keep_high, @default_keep_high}
    ]
  end
end
