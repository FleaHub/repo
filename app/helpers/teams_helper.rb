module TeamsHelper


  def current_user=(user)
    @current_user = user
  end


  def current_user?(user)
    user == current_user
  end


  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def link_to_remove_fields(name, builder)
    builder.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

end


