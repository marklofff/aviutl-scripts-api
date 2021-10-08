defmodule AviutlScripts.Guardian do
  use Guardian, otp_app: :team_recruit

  def subject_for_token(%AviutlScripts.Accounts.User{} = user, _claims) do
    {:ok, to_string(user.id)}
  end
  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(%{"sub" => id}) do
    case AviutlScripts.Accounts.get_user!(id) do
      nil ->
        {:error, :reason_for_error}
      user ->
        {:ok, user}
    end
  end

  def resource_from_claims(_) do
    {:error, :reason_for_error}
  end
end

