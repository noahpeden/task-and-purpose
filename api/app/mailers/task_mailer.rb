class TaskMailer < ApplicationMailer
  def duedate_reminder_email
    @task = Task.find_by(id: params[:task_id])
    mail(to: 'exmaple@email.com', subject: 'Welcome to Task and Purpose')
  end
end
