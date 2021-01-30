class IngredientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ingredient, only: [:show, :update, :destroy]

  # GET /ingredients
  def index
    @ingredients = current_user.ingredients.all

    render json: @ingredients
  end

  # GET /ingredients/1
  def show
    render json: @ingredient
  end

  # POST /ingredients
  def create
    @ingredient = current_user.ingredients.build(ingredient_params)

    if @ingredient.save
      render json: IngredientSerializer.new(@ingredient).serializable_hash[:data][:attributes], status: :created, location: @ingredient
    else
      render json: @ingredient.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    if @ingredient.update(ingredient_params)
      render json: IngredientSerializer.new(@ingredient).serializable_hash[:data][:attributes]
    else
      render json: @ingredient.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient.destroy
    render json: {id: @ingredient.id}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = current_user.ingredients.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :content, :user_id, :recipe_id)
    end
end
