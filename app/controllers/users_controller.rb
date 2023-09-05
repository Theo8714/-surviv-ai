class UsersController < ApplicationController
  def show
    @user = current_user
    user_relationships = @user.relationships
    @debtor_analyzers = user_relationships.map do |relationship|
      deb_analyze = DebtorAnalyzer.new(relationship)
      deb_analyze.perform
      deb_analyze
    end
    invoices = @user.invoices
    @month_analyzers = (1.year.ago.to_date..Date.today).map do |date|
      month = date.month
      year = date.year
      MonthAnalyzer.new(@user, month, year)
    end

    months = (1.year.ago.to_date..Date.today).map { |date| "#{date.month} #{date.year}" }
    days_of_payment = @month_analyzers.map { |analyzer| analyzer.perform }

    data_points = months.each_with_index.map do |month, index|
      {
        x: month,
        y: days_of_payment[index]
      }
    end

    @chart_data2 = {
      labels: months,
      datasets: [{
        label: 'Moyenne des Jours de Paiement',
        backgroundColor: '#3B82F6',
        borderColor: '#3B82F6',
        data: data_points,
        fill: false,
        lineTension: 0
      }]
    }

    @chart_options2 = {
      scales: {
        xAxes: [{
          type: 'category',
          position: 'bottom',
          scaleLabel: {
            display: true,
            labelString: 'Mois'
          }
        }],
        yAxes: [{
          ticks: {
            beginAtZero: true
          },
          scaleLabel: {
            display: true,
            labelString: 'Nombre de Jours de Paiement'
          }
        }]
      },
      legend: {
        display: true,
        position: 'bottom'
      }
    }

    # @chart_data2 = {
    #   labels: (1.year.ago.to_date..Date.today).map { |date| "#{date.month} #{date.year}" },
    #   datasets: [{
    #     label: 'Moyenne des Jours de Paiement',
    #     backgroundColor: '#3B82F6',
    #     data: @month_analyzers.map { |analyzer| analyzer.perform }
    #   }]
    # }

    # @chart_options2 = {
    #   scales: {
    #     yAxes: [{
    #       ticks: {
    #         beginAtZero: true
    #       }
    #     }]
    #   },
    #   legend: {
    #     display: true,
    #     position: 'bottom'
    #   }
    # }

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
