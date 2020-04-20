module Types
  class UserType < Types::BaseObject
    description "A user"

    field :email, String, null: false
  end
end
