class Api::CampaignsController < Api::BaseController

    before_action :set_campaign, only: [:show, :update, :destroy]

    def my_campaigns
        all_campaigns = current_user.campaigns
        render json: all_campaigns.to_json
    end    

    # POST /create_comment
    def create_comment
      logger.info "1"
      @comment = Comment.new(comment_params)
      logger.info "2"
      if @comment.save
        logger.info "3"
        render json: @comment, status: :created
      else
        logger.info "4"
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
    
    ##
    ## Below is from scaffold
    ##

    # GET /campaigns
    def index
      @campaigns = Campaign.all
  
      render json: @campaigns
    end
  
    # GET /campaigns/1
    def show
        @campaign = Campaign.find(params[:id])
        @comments = @campaign.comments
        h = { :campaign => @campaign, :comments => @comments }
        logger.info h
        render json: { :campaign => @campaign, :comments => @comments }
    end
  
    # POST /campaigns
    def create
      @campaign = Campaign.new(campaign_params)
      if @campaign.save
        render json: @campaign, status: :created
      else

        render json: @campaign.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /campaigns/1
    def update
      if @campaign.update(campaign_params)
        render json: @campaign
      else
        render json: @campaign.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /campaigns/1
    def destroy
      @campaign.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_campaign
        @campaign = Campaign.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def campaign_params
        params.fetch(:campaign, {}).permit(:user_id, :category_id, :name, :description, :goal)
      end

      def comment_params
        params.fetch(:comment, {}).permit(:user_id, :campaign_id, :content)
      end
end