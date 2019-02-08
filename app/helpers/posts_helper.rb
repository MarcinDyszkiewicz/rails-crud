module PostsHelper
  def publish_button(text, model)
     button_to text, publish_post_path(model), class: "btn btn-info btn-sm", styles: "display: inline"

  end
end
