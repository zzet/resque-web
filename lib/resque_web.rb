require "resque_web/engine"

module ResqueWeb
  def self.add_tab(link, route)
    ResqueWeb::ApplicationHelper.tabs[link] = route
  end
end
