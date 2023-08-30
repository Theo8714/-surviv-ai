class UsersController < ApplicationController
  def show
    @user = current_user
    user_relationships = @user.relationships
    @debtor_analyzers = user_relationships.map do |relationship|
      deb_analyze = DebtorAnalyzer.new(relationship)
      deb_analyze.perform
      deb_analyze
    end
  end
end
