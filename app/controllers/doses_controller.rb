class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end
 # POST /doses
  # POST /doses.json
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
     redirect_to @cocktail
    else
      render :new
    end
  end

  # PATCH/PUT /doses/1
  # PATCH/PUT /doses/1.json

  # DELETE /doses/1
  # DELETE /doses/1.json
  def edit
      # @cocktail = cocktail.find(params[:id])
      raise
  end

  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to doses_url, notice: 'dose was successfully destroyed.' }
    end
  end

  private
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
end

