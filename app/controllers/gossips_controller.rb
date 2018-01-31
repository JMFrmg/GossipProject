class GossipsController < ApplicationController

  def index #controlleur de la page qui affiche la liste de tous les ragots
  	@gossips = Gossip.all

  end

  def new #renvoie de la view 'new'
  	@gossip = Gossip.new
  end

  def create #controlleur appelé par la view 'new' pour créer un nouveau ragot et l'ajouter à la base de données
  	@gossip = Gossip.new(gossips_params)
  	if @gossip.save #Redirection vers la view 'show' qui affiche les détails et les options du nouveau ragot
  		redirect_to @gossip
  	else
  		render 'new' #Redirection vers la page 'new' en cas d'échec de création d'un nouveau ragot
  	end
  	
  end

	def show #détails d'un ragot
		@gossip = Gossip.find(params[:id])

	end

	def edit #renvoie vers la view d'édition d'un ragot
		@gossip = Gossip.find(params[:id])
	end

	def update #modifie un ragot et sauvegarde les modification dans la base de données
		@gossip = Gossip.find(params[:id])
		if @gossip.update(params.require(:gossip).permit(:anonymous_author, :content))
    	redirect_to @gossip
  		end
	end

	def destroy #suppression d'un ragot
		@gossip = Gossip.find(params[:id])
  		@gossip.destroy
 		redirect_to gossips_path
	end

	private #on ne récupère de la view que les données qui nous intéressent (anonyme_user et content) - placé ici dans le script par convention
  	def gossips_params
  		params.permit(:anonymous_author, :content)
  	end
end


