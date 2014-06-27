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
end