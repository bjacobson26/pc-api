module Api
  module V1
    class VotesController < ApplicationController

      def upvote
        bill = Bill.find_or_create(params[:bill_identifier])
        user = User.find(params[:id])
        if bill.liked_by user
          render json: { status: 200, message: "User: #{user.id} upvoted bill #{bill.bill_identifier}" }
        else
          render json: { status: "Fucked", message: "Something bad happened, check the logs" }
        end
      end


    end
  end
end
