class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    @recipes = current_user.recipes

    render json: RecipeSerializer.new(@recipes).serializable_hash[:data].map {|hash| hash[:attributes]}
  end

  # GET /recipes/1
  def show
    render json: {
      id: params[:id],
    ingredientsAttributes: RecipeIngredientSerializer.new(@recipe, include: [:ingredients]).serializable_hash[:included].map{|x| x[:attributes]}
  }
  end

  # POST /recipes
  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      render json: @recipe, status: :created, location: @recipe
    else
      render json: @recipe.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    render json: {id: @recipe.id}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = current_user.recipes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:name)
    end
end
