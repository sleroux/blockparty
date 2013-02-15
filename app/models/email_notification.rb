class EmailNotification < ActiveRecord::Base
  attr_accessible :type

  def perform
    p "Mail the crap out of the notification"
  end
end
