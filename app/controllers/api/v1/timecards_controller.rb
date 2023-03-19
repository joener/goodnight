# frozen_string_literal: true

module Api
  module V1
    class TimecardsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        timecards = Timecard.where(user_id: params[:user_id]).order(created_at: :DESC).limit(50)
        render json: { timecards: timecards, success: true }
      end

      def time_in
        timecard = Timecard.new
        timecard.time_in = Time.now
        timecard.user_id = params[:user_id]

        if timecard.save
          render json: { timecard: timecard, success: true }
        else
          render json: { error: timecard.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def time_out
        timecard = Timecard.new
        timecard.time_out = Time.now
        timecard.user_id = params[:user_id]

        if timecard.save
          render json: { timecard: timecard, success: true }
        else
          render json: { error: timecard.errors.full_messages }, status: :unprocessable_entity
        end
      end

    end
  end
end
