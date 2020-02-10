defmodule MyNif do
    use Rustler, otp_app: :my_app, crate: "mynif"

    # When your NIF is loaded, it will override this function.
    def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
    def generate(_num, _upper), do: :erlang.nif_error(:nif_not_loaded)
end
