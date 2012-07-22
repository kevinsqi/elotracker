module ApplicationHelper
  def link_to_player(player, html_options = {})
    link_to player.name, player_path, html_options
  end
end
