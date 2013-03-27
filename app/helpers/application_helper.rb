module ApplicationHelper

    # returns the  ititle without a trailing | if no page title is provided
    def full_title(page_title)
        base_title = "Ruby on Rails Tutorial Sample App"
        page_title.empty? ? base_title : "#{base_title} | #{page_title}"
    end
end
