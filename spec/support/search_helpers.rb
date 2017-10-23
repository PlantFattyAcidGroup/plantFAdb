require 'rails_helper'
module Features
  module SearchHelpers
    def fill_autocomplete(field, options = {})
      # send_keys triggers the autocomplete. Standard fill_in did not
      form_item = find(field)
      form_item.send_keys options[:with]
      # Wait for expected item to be present. Use xpath selector for poltergeist
      expect(page).to have_xpath "//li[contains(text(), '#{options[:with]}')]"
      # Use jquery :contains to select and click item
      page.execute_script %Q{ $("li:contains('#{options[:with]}')").trigger("mouseenter").trigger("click"); }
    end
  end
end