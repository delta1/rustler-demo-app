require MyApp
require MyNif

{microseconds, _} = :timer.tc(MyApp, :generate, [10_000_000, 1_000_000])

IO.puts("MyApp.generate #{microseconds} microseconds / #{microseconds / 1_000_000} seconds")

{microseconds, ints} = :timer.tc(MyNif, :generate, [10_000_000, 1_000_000])

IO.puts("MyNif.generate #{microseconds} microseconds / #{microseconds / 1_000_000} seconds")
