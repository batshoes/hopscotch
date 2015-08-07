class RulesController < ApplicationController
  def destroy
    @rule = Rule.find params[:id]
    @rule.destroy
    redirect_to edit_game_path(@rule.game_id)
  end
end
