class GossipsController < ApplicationController

  def index
  	@gossips = Gossip.all

  end

  def new
  	@gossip = Gossip.new
  end

  def create
  	@gossip = Gossip.new(gossips_params)
  	if @gossip.save
  		redirect_to @gossip
  	else
  		render 'new'
  	end
  	
  end

	def show
		@gossip = Gossip.find(params[:id])

	end

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
		if @gossip.update(params.require(:gossip).permit(:anonymous_author, :content))
    	redirect_to @gossip
  		end
	end

	def destroy
		@gossip = Gossip.find(params[:id])
  		@gossip.destroy
 		redirect_to gossips_path
	end

	private
  	def gossips_params
  		params.permit(:anonymous_author, :content)
  	end
end


