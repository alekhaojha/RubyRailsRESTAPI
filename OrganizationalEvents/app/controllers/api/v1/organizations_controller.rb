module Api
  module V1
    class OrganizationsController < ApplicationController
      #list all organization
      def index
        @Organization = Organization.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded Events', data:@Organization},status: :ok
      end

      
      def show
        @Organization = Organization.find_by_orgname('ILLUMINA');
        #@Organization = Organization.find_by_sql["SELECT * FROM organization"];
        render json: {status: 'SUCCESS', message:'Organization Detail', data:@Organization},status: :ok
      end

      #Create organization
      def create
      @Organization = Organization.new(organization_params)
      if @Organization.save
          render json: {status: 'SUCCESS', message:'saved Organization', data:@Organization},status: :ok
      else
          render json: {status: 'ERROR', message:'organization not saved', data:@Organization.errors},status: :unprocessable_entity
      end
      end

      #Delete organization
      def destroy
          @Organization = Organization.find(params[:id]);
          @Organization.destroy
          render json: {status: 'SUCCESS', message:'Deleted organization', data:@Organization},status: :ok
      end

      #Update Organization
      def update
        @Organization = Organization.find(params[:id]);
        if @Organization.update_attributes(event_params)
            render json: {status: 'SUCCESS', message:'organization Updated', data:@Organization},status: :ok
        else
            render json: {status: 'ERROR', message:'organization not Updated', data:@Organization.errors},status: :unprocessable_entity
        end

      end


      private

      def organization_params
        params.permit(:orgname, :country, :state, :city, :street)
      end

    end
  end
end
