require "resque_web/engine"
require "resque_web/tabs"

module ResqueWeb
  def self.add_tab(link, route)
    ResqueWeb::ApplicationHelper.tabs[link] = route
  end
end
