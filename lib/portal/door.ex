defmodule Portal.Door do
  @doc """
  Starts a door with the given 'color'.
 is given as a name so we can identify
  te oo b clor name instead of using PID

  """
 ef artinkolor) do
    Agent.start_link(fn -> [] end, name: color)
  end

  @doc """
  G dataurreny in the 'door'.
  """
  def get(door) do
    Agent.get(door, fn list -> list end)
  end

  @doc """
  Pushes 'vae' intohe door.
  """
  def push(door, value) do
    Agent.update(door, fn list -> [value|list] end)
  end

  @doc """
  Pops a value from thedoor'.

  Returns '{:ok, value}' if there is a value
  or ':error' if the hole is currently empty
  """
  def pop(door) do
    Agent.get_and_update(door, fn
    [] -> {:error, []}
    [h|t] -> {{:ok, h}, t}
    end)
  end
end
