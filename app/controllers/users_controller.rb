# require_relative '../services/debtor_analyzer'

class UsersController < ApplicationController
  def show
    @user = current_user
    user_relationships = @user.relationships
    @debtor_analyzers = @user.debtors.map do |debtor|
      deb_analyze = DebtorAnalyzer.new(debtor)
      deb_analyze.perform
      deb_analyze
    end
  end
end
