class CategoriesController < ApplicationController

    before_action :set_author, only: [:show, :edit, :update, :destroy]
    
    def index
        @categories = Categorie.active.alphabetical.paginate(:page => params[:page]).per_page(10)
    end
    
    def new
        @categorie = Categorie.new
    end
    
    def create
        @categorie = Categorie.new(author_params)
        if @categorie.save
            redirect_to author_path(@categorie), notice: "#{@categorie.name} was added to the system."
        else
            render action: 'new'
        end
    end

    def update
        if @categorie.update(author_params)
            redirect_to author_path(@categorie), notice: "#{@categorie.name} was revised in the system."
        else
            render action: 'edit'
        end
    end
    
    def destroy
        @categorie.destroy
        redirect_to authors_url
    end
    
    private
    def categorie_params
        params.require(:categorie).permit(:name, :active)
    end
    
    def set_categorie
        @categorie = Categorie.find(params[:id])
    end



end
