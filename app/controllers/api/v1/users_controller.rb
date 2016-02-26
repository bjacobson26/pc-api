module Api
  module V1
    class UsersController < ApplicationController

      def index
        @users = User.all
        render json: @users
      end

      def show
        @user = User.find(params[:id])
        render json: @user
      end

      def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          render json: @user
        else
          render json: @user.errors
        end
      end

      def votes
        user = User.find(params[:id])
        if user.errors.any?
          render json: { errors: user.errors }
        else
          render json: { 
            total_votes: user.votes.count, 
            total_upvotes: user.upvotes.count,
            total_downvotes: user.downvotes.count, 
            votes: user.votes 
          }
        end
      end

      private

      def user_params
        params.require(:user).permit(
          :name,
          :gender,
          :dob,
          :party
        )
      end

    end
  end
end
