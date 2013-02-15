class BlockListServer < ActiveRecord::Base
  attr_accessible :name, :url
  has_many :queries
  has_and_belongs_to_many :mail_servers,
    :after_add => :notify_blacklist,
    :after_remove => :notify_unblacklisted

  validates_presence_of :name, :url
  validates :url, :format => { :with => URI::regexp(%w(http https)), :message => "Must be a valid IP address with scheme"}

  def query_string(mailserver_ip)
    # validate target_ip
    uri = URI.parse(url)
    reversed_octets = mailserver_ip.split('.').reverse.join(".")
    "#{[reversed_octets, uri.host].join(".")}"
  end

  def notify_blacklist
    notification = EmailNotification.new
    notification.type = "Notification::Blacklisted"
    notification.save
    notification.send_later(:perform)
  end

  def notify_unblacklisted
    notification = EmailNotification.new
    notification.type = "Notification::Unblacklisted"
    notification.save
    notification.send_later(:perform)
  end
end
