class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
      # scope.where(user:user)
    end
  end
  # Très important de le mettre en dehors de la classe Scope
  def create?
    true
  end

  def show?
    true
  end

  def update?
    # Personne qui est propriétaire pourra mettre à jour
    record.user == user || user.admin?
  end

  def destroy?
    # Personne qui est propriétaire pourra mettre à jour
    record.user == user
  end
end
