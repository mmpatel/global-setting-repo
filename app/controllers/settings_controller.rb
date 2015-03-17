class SettingsController < ApplicationController

  def index
  	@settings = Setting.order("created_at DESC")
  end

  def create
    setting = Setting.unscoped.create(setting_params)
    redirect_to settings_path
  end

  def update
  	setting = Setting.find(params[:id])
  	setting.update_attributes(:value => params[:setting][:value])
  	render :json => setting
  end

  def destroy
  	setting = Setting.find(params[:id])
  	setting.destroy
  	redirect_to settings_path
  end
private
    def setting_params
      params.require(:setting).permit(:var, :value)
    end
end