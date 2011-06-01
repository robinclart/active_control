# ActiveControl

Activecontrol is a very simple authorization solution with no depedencies. Each rule is stored in the class that grant permission. Other object can then check if they have access to a specific action via the `can?` method.

## Usage

Include ActiveControl::Ability in the object which needs to check if it can perform an action on another object.

    class User
      include ActiveControl::Ability
    end

At the other end include ActiveControl::Authorization in the object that will  give its "blessing" or not based on some internal rules defined by you. Rules are just normal methods you have to defined at the instance level with a specific name. I.g. if an instance of the `User:Class` wants to update another object you have to define `authorize_user_to_update?(user)` and make it returns a boolean.

    class Page
      include ActiveControl::Authorization
  
      ...
  
      def authorize_user_to_update?(user)
        user.id == page.user_id
      end
    end

Then you can do something like this

    if @user.can? :update, @page
      @page.update_attributes(params[:page])
    else
      ...
    end

And that's it. Simple uh!
