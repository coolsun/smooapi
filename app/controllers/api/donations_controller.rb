class Api::DonationsController < Api::BaseController
    def index
        all_donations = Donation.all
        render json: all_donations.to_json
    end

    def show
        donation = Donation.find_by(id: params[:id])
        render json: donation.to_json
    end
end