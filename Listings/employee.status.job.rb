class EmployeeStatusJob
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { weekly }

  def perform
    @users = User.all.order(:last_name)
    @users.each do |user|
      user.update_columns(employee_active: EmployeeStatus.check_employee_status(user.id) == "Active")
    end
  end
end
