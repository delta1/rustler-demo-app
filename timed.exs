require MyApp
require MyNif

{microseconds, _} = :timer.tc(MyApp, :generate, [20_000_000, 1_000_000])

IO.puts("MyApp.generate #{microseconds} microseconds / #{microseconds / 1_000_000} seconds")

{microseconds, ints} = :timer.tc(MyNif, :generate, [20_000_000, 1_000_000])

IO.puts("MyNif.generate #{microseconds} microseconds / #{microseconds / 1_000_000} seconds")

{microseconds, _} = :timer.tc(Enum, :sort, [ints])

IO.puts("Enum.sort #{microseconds} microseconds / #{microseconds / 1_000_000} seconds")

{microseconds, _} = :timer.tc(MyNif, :sort, [ints])

IO.puts("MyNif.sort #{microseconds} microseconds / #{microseconds / 1_000_000} seconds")
