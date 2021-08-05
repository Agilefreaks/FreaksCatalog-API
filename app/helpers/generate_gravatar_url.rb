# frozen_string_literal: true

require 'digest/md5'

def generate_gravatar(mail = nil)
  mail.nil? ? "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest('freakdefault@gmail.com')}" : "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(mail)}"
end
