class StrainsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    strain = user.strains.build(strains_params)
    strain.save

    redirect_to user_path(user)
  end

  def edit
    @strain = User.find(params[:user_id]).strains.find(params[:id])
  end

  def update
    user = User.find(params[:user_id])
    strain = user.strains.find(params[:id])

    strain.update(strains_params)

    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:user_id])
    strain = user.strains.find(params[:id])
    strain.destroy

    redirect_to user_path(user)
  end

  private

  def strains_params
    params.require(:strain).permit(:name, :brand, :strain_type, :form, :notes)
  end

end
