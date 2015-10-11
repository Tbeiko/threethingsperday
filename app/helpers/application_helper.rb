module ApplicationHelper

  def card_color(todo)
    if todo.status == nil
      "bg-info"
    elsif todo.status == "completed"
      "bg-success"
    elsif todo.status == "failed"
      "bg-danger"
    end
  end
end
