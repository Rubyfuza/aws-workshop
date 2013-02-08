class ChirpCreationService
  def create(params)
    user_name = params.delete(:user_name)
    user = User.find_or_create_by_name!(user_name)
    Chirp.create(params.merge(:user_id => user.id))
  end
end
