module AdminHelper
  def admin_pages
    # TODO: something more elegant
    non_scaffold_pages = %w(dashboard sessions passwords)

    Dir.glob(Rails.root.join('app', 'controllers', 'admin', '*.rb')).map do |path|
      filename      = File.basename(path)
      resource_name = filename.sub(/_controller\.rb$/, '')

      unless non_scaffold_pages.include? resource_name
        {
            name:       resource_name.humanize,
            controller: "#{resource_name}",
            url:        self.send("admin_#{resource_name}_path")
        }
      end
    end.compact
  end

  def per_page_class(klass, i)
    (params[:per_page].to_i == i || (params[:per_page].nil? && klass.default_per_page == i)) ? 'btn-primary' : 'btn-default'
  end

  def simple_bootstrap_form_for(resource, opts={}, &block)
    type = opts.delete(:type) || :horizontal
    raise 'Supported types: horizontal, vertical' unless type.to_sym.in? [ :horizontal, :vertical ]

    opts = {
        html: { class: "form-#{type}" },
        wrapper: :"#{type}_form",
        wrapper_mappings: { check_boxes: :"#{type}_radio_and_checkboxes",
                            radio_buttons: :"#{type}_radio_and_checkboxes",
                            file: :"#{type}_file_input",
                            boolean: :"#{type}_boolean" }
    }.merge!(opts)

    simple_form_for(resource, opts, &block)
  end
end