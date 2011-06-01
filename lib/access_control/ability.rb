module AccessControl
  # == Access Control Ability
  #
  # FIXME: Explain what this class does.
  #
  # To implement, just include AccessControl::Ability in your class:
  #
  #   class User
  #     include AccessControl::Ability
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
