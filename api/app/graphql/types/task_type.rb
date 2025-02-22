module Types
  class TaskType < Types::BaseObject
    field :id, ID
    field :name, String
    field :complete, Boolean
    field :user, Types::UserType, null: true
    field :user_id, ID, null: true
    field :duedate, GraphQL::Types::ISO8601Date, null: true

    def id
      object.to_global_id.to_s
    end
  end
end
