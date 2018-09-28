module ApplicationHelper
def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name,"javascript:void(0)", :onClick => "remove_fields(this)")
  end
  def link_to_add_fields(name, f, association, partial , locals = {})
    new_object = association.to_s.classify.constantize.new
    fields = f.fields_for(association, new_object, :child_index => "new_{association}") do |builder|
     locals[:f] = builder
     render(:partial => partial, :locals => locals)
    end
    link_to_function name, "add_fields(this, \"{association}\", \"#{escape_javascript(fields)}\")"
  end
end
