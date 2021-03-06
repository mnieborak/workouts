defmodule Api.Schema do
  use Absinthe.Schema

  import_types(Api.Schema.Types)

  alias Api.Resolvers

  query do
    @desc "Get all workouts"
    field :workouts, list_of(:workout) do
      arg(:by_name, :string)

      resolve(&Resolvers.Workouts.all/3)
    end
  end

  mutation do
    @desc "Create workout"
    field :create_workout, :workout do
      arg :name, non_null(:string)
      arg :sets, list_of(:set_input)

      resolve &Resolvers.Workouts.create/3
    end
  end
end
