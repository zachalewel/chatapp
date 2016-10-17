require 'base64'
require_relative '../../models/message'
module Cypher
  class MessagesCypherController < ApplicationController
    def self.text_in(arg)
      @msg = Base64.encode64(arg)
    end
  end
end
