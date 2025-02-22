module Mutations
  class UpdateTask < BaseMutation
    field :task, Types::TaskType, null: false

    argument :task_id, ID, required: true, loads: Types::TaskType
    argument :name, String, required: true
    argument :complete, Boolean, required: true
    argument :user_id, ID, required: true
    argument :duedate, GraphQL::Types::ISO8601Date, required: false

    def resolve(task:, name:, complete:, user_id:, duedate:)
      if task.complete != complete && complete == true
        NotifyTeamLeaderMailer.notify_team_leader(task.id, user_id).deliver
        task.update!(name: name, complete: complete, user_id: user_id, duedate: duedate)
      end
      task.update!(name: name, complete: complete, user_id: user_id, duedate: duedate)
      { task: task }
    end
  end
end
