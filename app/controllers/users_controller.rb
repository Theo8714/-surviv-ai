class UsersController < ApplicationController
  def show
    @user = current_user
    user_relationships = @user.relationships
    @debtor_analyzers = user_relationships.map do |relationship|
      deb_analyze = DebtorAnalyzer.new(relationship)
      deb_analyze.perform
      deb_analyze
    end
    @chart_data = {
      labels: @debtor_analyzers.map { |analyzer| analyzer.debtor.company_name },
      datasets: [{
        label: 'Montant total des factures',
        backgroundColor: '#3B82F6',
        data: @debtor_analyzers.map(&:total_invoices_amount)
      },
      {
        label: 'Montant total des factures impayées',
        backgroundColor: '#EF4444',
        data: @debtor_analyzers.map(&:unpaid_amount)
      }]
    }

    @chart_options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }

    @chart_data1 = {
      labels: @debtor_analyzers.map { |analyzer| analyzer.debtor.company_name },
      datasets: [{
        label: 'Moyenne des Jours de Paiement',
        backgroundColor: '#3B82F6',
        data: @debtor_analyzers.map { |analyzer| analyzer.relationship.payment_days.to_i }
      }]
    }

    @chart_options1 = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  end
end
