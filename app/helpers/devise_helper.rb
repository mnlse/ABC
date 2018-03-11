module DeviseHelper
  def devise_error_messages!
    if resource.errors.any?
      messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

      html = <<HTML
      <script>
        toastr['error']('#{messages}')
      </script>
HTML
      html.html_safe
    end
  end
end
