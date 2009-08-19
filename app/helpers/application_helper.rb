# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

    def show_topquote
      Topquote.find(:last, :limit  => 1).title
    end

end
