module ActiveControl
  # == Active Control Authorization
  #
  # Creates an +authorize?+ method.
  #
  # To implement, just <tt>include ActiveControl::Authorization</tt> in your
  # class:
  #
  #   class User
  #     include ActiveControl::Authorization
  #   end
  #
  # The +authorize?+ method is responsible for giving authorization to another
  # object to perform a specific action.
  #
  # Internally +authorize?+ will delegate to another method. The name of this
  # other method is defined during runtime and is based on two things:
  #
  # * the class name of the object seeking for permission;
  # * the action name.
  #
  # E.g. if an instance of the <tt>User:Class</tt> wanted to update your object
  # you'd have to define a +authorize_user_to_update?+ method.
  module Authorization
    def authorize?(caller_object, action)
      caller_name = caller_object.class.name.gsub("::", "_")
      action = [caller_name, action.to_s].join("_to_").downcase
      self.send "authorize_#{action}?", caller_object
    end
  end
end
