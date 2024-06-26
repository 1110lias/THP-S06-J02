class GossipsController < ApplicationController

  def index
    puts "here first"
    @gossips = Gossip.all
    puts "here!"
  end

  def show
    @gossip = Gossip.find(params[:id])
    puts params[:id]
  end
  
  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)

    if @gossip.save
      redirect_to gossips_path, notice: 'Gossip créé avec succès!'
      flash[:success] = "C'EST UN SUCCES!BRAVO!" #pour afficher le bandeau alerte (Voir html new)
    else
      render :new
      flash[:danger] = "C'EST FOIRE" #pour afficher le bandeau alerte (Voir html index)
    end
  end

  private
  
  def gossip_params
    params.require(:gossip).permit(:title, :description, :user_id)
  end
end
