# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        user = User.new
        user.name = params[:name]

        if user.save
          render json: { user: user, success: true }
        else
          render json: { error: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def follow
        user = User.find(params[:user_id])
        follower = User.find(params[:follower_id])
        if user && follower
          follower.user_follows.first_or_initialize.tap do |user_follow|
            user_follow.user_id = user.id
            user_follow.save!
          end

          render json: { message: "user followed successfully", success: true }
        else
          render json: { error: "user or follower doesn't exist." }, status: :unprocessable_entity
        end
      end

      def unfollow
        user = User.find(params[:user_id])
        follower = User.find(params[:follower_id])
        if user && follower
          follower.user_follows.where(user_id: user.id).destroy_all
          render json: { message: "user unfollowed successfully", success: true }
        else
          render json: { error: "user or follower doesn't exist." }, status: :unprocessable_entity
        end
      end

    end
  end
end
