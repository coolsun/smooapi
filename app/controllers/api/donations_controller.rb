class Api::DonationsController < Api::BaseController


    def index
        all_donations = current_user.donations
        render json: all_donations.to_json
    end

    def show
        donation = Donation.find_by(id: params[:id])
        render json: donation.to_json
    end

    # POST /create
    def create
        logger.info "1"
        logger.info "donation_params:#{donation_params}"
        donation = Donation.new(donation_params)
        logger.info "donation:#{donation.inspect}"
        if donation.save
            logger.info "save ok"
            render json: donation, status: :created
        else
            logger.info "save error"
            render json: donation.errors, status: :unprocessable_entity
        end
    end

    private
        def donation_params
            params.fetch(:donation, {}).permit(:user_id, :campaign_id, :amount)
        end
end