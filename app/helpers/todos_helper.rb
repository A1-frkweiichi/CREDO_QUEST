module TodosHelper
  def todo_meta_tags(todo)
    set_meta_tags(
      og: {
        image: ActionController::Base.helpers.image_url("ogp.jpg")
      },
      twitter: {
        image: ActionController::Base.helpers.image_url("ogp.jpg")
      }
    )
  end
end
