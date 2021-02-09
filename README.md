# Due Date Reminder plugin for Redmine 4.X
Plugin that send out notification to assignee about the due date. Only if a due date is set.
A notification is send even if the issue is overdue

User can chose in 'Account Settings' on which days notification should be sent.
The days of the week must be written as numbers and divided using a comma (1,2,3)

## Compatibility
* redmine 4.x and up

## Installation
	git clone git://github.com/0x2c4/redmine_due_date_reminder.git /your_redmine_root_directory/plugins/due_date_reminder
	cd /your_redmine_root_directory/
	bundle install
	bundle exec rake redmine:plugins:migrate RAILS_ENV=production

## Sending notifications
	cd /your_redmine_root_directory/
	bundle exec rake redmine:reminder_plugin:send_notifications RAILS_ENV=production

Now the best solution is to use crontab to automate sending out notification.
Learn more about cron at http://en.wikipedia.org/wiki/Cron

## License

This plugin is licensed under the MIT license.
fork [f0y](https://github.com/f0y)
