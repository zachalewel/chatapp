class Message < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  attr_accessor :attachment
  mount_uploader :attachment, AttachmentUploader
end
