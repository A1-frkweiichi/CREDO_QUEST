module UsersHelper
  def progress_bar_color(index)
    case index
    when 0
      "bg-primary"
    when 1
      "bg-success"
    when 2
      "bg-info"
    when 3
      "bg-warning"
    when 4
      "bg-danger"
    else
      "bg-secondary"
    end
  end
end
