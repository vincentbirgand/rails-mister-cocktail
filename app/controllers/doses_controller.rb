class DosesController < ApplicationController
 before_action :set_dose, only: [:edit, :destroy]

 def new
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose = Dose.new
 end

 def create
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose = Dose.new(dose_params)
   @dose.cocktail = @cocktail
   if @dose.save
     redirect_to cocktail_path(@cocktail)
   else
     render :new
   end
 end

 def destroy
   @dose.destroy
 end

 private

 def set_dose
   @dose = Dose.find(params[:id])
 end

 def dose_params
   params.require(:dose).permit(:id, :description, :ingredient_id)
 end
end
