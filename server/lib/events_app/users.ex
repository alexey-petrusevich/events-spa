# BASED ON LECTURE NOTES OF PROFESSOR NAT TUCK
defmodule EventsApp.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias EventsApp.Repo

  alias EventsApp.Users.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id) do
    IO.inspect("getting user with id = ")
    IO.inspect(id)
    user = Repo.get!(User, id)
    IO.inspect("found user")
    IO.inspect(user)
    user
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end


  def get_user_by_name!(name) do
    Repo.get_by!(User, name: name)
  end

  def get_user_by_name_email!(name, email) do
    Repo.get_by!(User, [name: name, email: email])
  end


  def authenticate(name, pass, email) do
    user = get_user_by_name_email!(name, email);
    case Argon2.check_pass(user, pass) do
      {:ok, user} -> user
      _ -> nil
    end
  end
end
