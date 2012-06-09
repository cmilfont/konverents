module ComponentsHelper
  class ComponentsFormBuilder < ActionView::Helpers::FormBuilder
    def input_comp(name_attr, options = {})
      "
      <div class='field'>
        #{ label(name_attr, options[:label]) }
        #{ text_field(name_attr, options) }
      </div>
      "
      .html_safe
    end

    def text_comp(name_attr, options = {})
      "
      <div class='field'>
        #{ label(name_attr, options[:label]) }
        #{ text_area(name_attr, options) }
      </div>
      "
      .html_safe
    end
  end
  
  ActionView::Base.default_form_builder = ComponentsFormBuilder
end
