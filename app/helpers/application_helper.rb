module ApplicationHelper
	def full_title page_title = ""
    base_title = "eLearning"

    return base_title if page_title.empty?
    page_title + " | " + base_title
  end
end

def custom_bootstrap_flash
  flash_messages = []
  option = "{'closeButton': true}"
  flash.each do |type, message|
    type = "success" if type == "notice"
    type = "warning" if type == "alert"
    text = "toastr.#{type}('#{message}');"
    flash_messages << text if message
  end
  flash_messages.join("\n")
end