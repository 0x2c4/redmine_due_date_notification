require 'redmine'
require_dependency 'reminder/view_hook'

Rails.configuration.to_prepare do
  require_dependency 'project'
  require_dependency 'principal'
  require_dependency 'user'
  unless User.included_modules.include? Reminder::UserPatch
    User.send(:include, Reminder::UserPatch)
  end

  require_dependency 'issue'
  unless Issue.included_modules.include? Reminder::IssuePatch
    Issue.send(:include, Reminder::IssuePatch)
  end

  require_dependency 'settings_controller'
  unless SettingsController.included_modules.include? Reminder::SettingsControllerPatch
    SettingsController.send(:include, Reminder::SettingsControllerPatch)
  end

  require_dependency 'my_controller'
  unless MyController.included_modules.include? Reminder::MyControllerPatch
    MyController.send(:include, Reminder::MyControllerPatch)
  end
end

Redmine::Plugin.register :due_date_reminder do
  name 'Due Date Reminder plugin'
  author '0x2c4'
  description 'notifications about due date'
  version '0.1'
  url 'https://github.com/0x2c4/redmine_due_date_reminder'
  author_url 'https://github.com/0x2c4'
  requires_redmine :version_or_higher => '4.0.0'
  settings :default => {'reminder_notification' => '1,2,3,4,5,6,7'}, :partial => 'reminder/settings'
end
