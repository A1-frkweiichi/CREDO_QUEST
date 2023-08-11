module TodosHelper
  def todo_meta_tags
    set_meta_tags(
      og: {
        url: "https://www.credo-quest.com/todos",
        image: ActionController::Base.helpers.image_url("ogp.jpg")
      },
      twitter: {
        image: ActionController::Base.helpers.image_url("ogp.jpg")
      }
    )
  end
end
