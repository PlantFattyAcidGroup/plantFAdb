class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    if user.is_admin?
      can :manage, :all
    elsif user.is_editor?
      can :autocomplete_measure_name, Measure
      can [:read, :create, :update, :autocomplete_plant_name], Plant
      can [:read, :create, :update], Pub
      can [:read, :create, :update], FattyAcid
      can [:read, :create, :update, :plant_yield], Result
      can [:read, :create, :update], PlantsPub
      can [:read, :create, :update], Dataset
      can [:read, :update], User, id: user.id
      
      # cannot update draft (update is used for 'publish')
      can [:read, :create, :destroy], Draftsman::Draft, whodunnit: user.id.to_s
    else
      can :read, Page
      can :read, Plant
      can :read, Pub
      can :read, FattyAcid
      can [:read,:plant_yield], Result
      can [:read, :update], User, id: user.id
      can :read, PlantsPub
      can :read, Dataset
      can :read, :species
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
