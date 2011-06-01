module ActiveControl
  # == Active Control Ability
  #
  # FIXME: Explain what this class does.
  #
  # To implement, just include ActiveControl::Ability in your class:
  #
  #   class User
  #     include ActiveControl::Ability
  #   end
  #
  # FIXME: Explain what to do next.
  module Ability
    # FIXME: Explain what this method returns
    def can?(action, remote_object)
      remote_object.authorize?(self, action)
    end

    # FIXME: Explain what this method returns
    def cannot?(*args)
      !can?(*args)
    end
  end
end
