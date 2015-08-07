class RulesController < ApplicationController
  def destroy
    @rule = Rule.find params[:id]
    @rule.destroy
    redirect_to games_path(current_user)
  end
end
