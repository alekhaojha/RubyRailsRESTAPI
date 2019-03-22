module Api
  module V1
    class EventsController < ApplicationController
      def index
        @OrganizationEvents = OrganizationalEvent.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded Events', data:@OrganizationEvents},status: :ok
      end
      def show
      @OrganizationEvent = OrganizationalEvent.find(params[:id]);
      render json: {status: 'SUCCESS', message:'Loaded Event', data:@OrganizationEvent},status: :ok
      end
      def create
      @OrganizationEvent = OrganizationalEvent.new(event_params)
      if @OrganizationEvent.save
          render json: {status: 'SUCCESS', message:'saved Event', data:@OrganizationEvent},status: :ok
      else
          render json: {status: 'ERROR', message:'Event not saved', data:@OrganizationEvent.errors},status: :unprocessable_entity
      end
      end
      def destroy
          @OrganizationEvent = OrganizationalEvent.find(params[:id]);
          @OrganizationEvent.destroy
          render json: {status: 'SUCCESS', message:'Deleted Event', data:@OrganizationEvent},status: :ok
      end
      def update
        @OrganizationEvent = OrganizationalEvent.find(params[:id]);
        if @OrganizationEvent.update_attributes(event_params)
            render json: {status: 'SUCCESS', message:'Event Updated', data:@OrganizationEvent},status: :ok
        else
            render json: {status: 'ERROR', message:'Event not Updated', data:@OrganizationEvent.errors},status: :unprocessable_entity
        end

      end
      private

      def event_params
        params.permit(:OrganizationName, :HostName, :EventMessage, :EventDateTime)
      end

    end
  end
end
