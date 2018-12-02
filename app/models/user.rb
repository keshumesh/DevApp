class User
  include Mongoid::Document
  include BCrypt
  
  field :name, type: String
  field :email, type: String
  field :password_hash , type: String
  field :phone, type: String
  field :gender, type: String
  field :dob, type: Date
  field :address, type: String
  field :avatar, type: String

  mount_uploader :avatar, AvatarUploader

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  
end
