module Api
  module V1
    class BillsController < ApplicationController
      def index
        @bills = Bill.all
        render json: @bills
      end

      def show
        @bill = Bill.find(params[:id])
        render json: @bill
      end

      def find
        @bill = Bill.find_by_bill_identifier(params[:bill_identifier])
        render json: @bill
      end

      def upvotes
        @votes = Bill.find_by_bill_identifier(params[:bill_identifier]).get_likes
        render json: @votes
      end

      def downvotes
        @votes = Bill.find_by_bill_identifier(params[:bill_identifier]).get_likes
        render json: @votes
      end

      def upvote_bill
        bill = Bill.find_by_bill_identifier(params[:bill_identifier])
        user = User.find(params[:user_id])
        if bill.liked_by user
          render json: { status: "Success" }
        else
          render json: { status: "Failed to upvote bill. Check the logs" }
        end
      end

      def downvote_bill
        bill = Bill.find_by_bill_identifier(params[:bill_identifier])
        user = User.find(params[:user_id])
        if bill.disliked_by user
          render json: { status: "Success" }
        else
          render json: { status: "Failed to downvote bill. Check the logs" }
        end
      end

      def votes
        bill = Bill.find_by_bill_identifier(params[:bill_identifier])
        if bill.errors.any?
          render json: { errors: bill.errors }
        else
          render json: { 
            bill: bill.bill_identifier, 
            total_votes: bill.total_votes,
            total_upvotes: bill.total_upvotes,
            total_downvotes: bill.total_downvotes
          } 
        end
      end

    end
  end
end
