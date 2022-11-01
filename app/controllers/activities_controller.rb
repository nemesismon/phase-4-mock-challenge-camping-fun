class ActivitiesController < ApplicationController
    def index
        activities = Activity.all
        render json: activities
    end

    def show
       
    end

    def destroy
        del_activity = Activity.find_by(id: params[:id])
        if del_activity != nil
            del_activity.signups.destroy
            del_activity.destroy
            render json: {}
        else
            render json: {error: 'Activity not found'}, status: :not_found
        end
    end
end
