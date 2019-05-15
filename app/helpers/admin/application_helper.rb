module Admin::ApplicationHelper
	def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
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