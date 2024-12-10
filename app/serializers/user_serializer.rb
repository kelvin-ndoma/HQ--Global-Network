class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email, :city, :country, :date_of_birth
end
