module ActiveControl
  # == Active Control Ability
  #
  # Creates two methods +can?+ and +cannot?+ to check if a remote object allows
  # this object to perform a specific action on it.
  #
  # To implement, just <tt>include ActiveControl::Ability</tt> in your class:
  #
  #   class User
  #     include ActiveControl::Ability
  #   end
  #
  # Those two methods requires that the remote object implements an +authorize?+
  # method that returns a boolean.
  #
  # A minimal implementation could be:
  #
  #   class User
  #     include ActiveControl::Ability
  #   end
  #
  #   class Post
  #     def authorize?(*args)
  #       true
  #     end
  #   end
  #
  # You could then do something like this:
  #
  #   user = User.new
  #   post = Post.new
  #
  #   puts user.can?(:update, post)
  #   >> true
  #
  # Instead of defining an +authorize?+ method manually you could also implement
  # ActiveControl::Authorization on the remote object.
  module Ability
    def can?(action, remote_object)
      remote_object.authorize?(self, action)
    end

    def cannot?(*args)
      !can?(*args)
    end
  end
end
