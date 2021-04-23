# frozen_string_literal: true

class Log < ApplicationRecord
  belongs_to :employee

  validate :one_check_in_by_day, on: :create
  validate :one_check_out_by_day, on: :update

  def one_check_in_by_day
    range = Time.now.beginning_of_day..Time.now.end_of_day
    error = 'check in already exist'
    errors.add :base, error if employee.logs.exists?(check_in: range)
  end

  def one_check_out_by_day
    range = Time.now.beginning_of_day..Time.now.end_of_day
    error = 'check out already exist'
    errors.add :base, error if employee.logs.exists?(check_out: range)
  end
end