module Api
  module V1
    class CustomersController < ApplicationController
      before_action :verify_token

      def index
        customers = Customer.all
        render json: customers.to_json( :include => [:address] )
      end

      def create
        @customer = Customer.new(customer_params)
        if @customer.save
          address = Address.new(address_params)
          address.customer_id = @customer.id
          address.save
          render json: { status: 200, response: "Customer created successfully."}
        else
          render json: { response: @customer.errors }
        end
      end

      def destroy
        @customer = Customer.find(params[:id])
        Address.find_by_id(@customer).delete
        if @customer.destroy
         render json: { status: 200, response: "Customer deleted successfully."}
        else
          render json: { status: 200, response: "Faild to delete customer."}
        end
      end

      def customer_filter
        customers = Address.where(street: params[:filter][:street]).map(&:customer_id)
        result = Customer.where(name: params[:filter][:name]).or(Customer.where(id: customers))
        render json: result.to_json( :include => [:address] )
      end

      private

      def verify_token
        token = Token.first.token
        if token == request.headers[:token]
          return true
        else
          render json: { status: 200, message: "Token not valid." }
        end
      end

      def customer_params
        params.require(:customer).permit(:name)
      end

      def address_params
        params.require(:customer).require(:address).permit(:street, :city, :zip_code)
      end
    end
  end
end
