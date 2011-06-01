module ActiveControl
  # == Active Control Authorization
  #
  # FIXME: Explain what this class does.
  #
  # To implement, just include ActiveControl::Authorization in your class:
  #
  #   class Comment
  #     include ActiveControl::Authorization
  #   end
  #
  # FIXME: Explain what to do next.
  module Authorization
    # FIXME: Explain what this method returns
    def authorize?(caller_object, action)
      caller_name = caller_object.class.name.gsub("::", "_")
      action = [caller_name, action.to_s].join("_to_").downcase
      self.send "authorize_#{action}?", caller_object
    end
  end
end
