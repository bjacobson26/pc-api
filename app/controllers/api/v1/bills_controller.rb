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

    end
  end
end
