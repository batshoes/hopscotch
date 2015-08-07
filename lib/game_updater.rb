class GameUpdater

    attr_accessor :game, :game_params

    def initialize(game)
      @game = game
    end

    def update(game_params)
      @game_params = game_params
      
      delete_removed_rules
      # @game.update game_params


      game_params[:rules_attributes].each do |_, r|
      id = r.delete(:id)
      if id.blank?
        game.rules.create!(r)
      else
        rule = game.rules.find(id)
        rule.update(r)
      end
    end
    @game.title = game_params[:title]
    @game.description = game_params[:description]
    @game.save
    game
  end

  private

  def delete_removed_rules
    game_rule_ids = game.rules.pluck :id
    puts game_params.inspect
    binding.pry
    submitted_rule_ids = game_params[:rules_attributes].map do |_, r|
      r[:id].to_i
    end.compact
   
    delete_game_ids = game_rule_ids - submitted_rule_ids
    game.rules.where(id: delete_game_ids).destroy_all
    game.reload
  end

end