module ApplicationHelper
  def body_classes
    [controller.controller_name, controller.action_name, extract_params_id].join(' ')
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "WebSchool"
    if page_title.empty?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end

  def mostra_campo_preenchido(label, value, *args)
    options = args.extract_options!
    simple_format("<strong>#{label}:</strong> <span>#{h options[:preffix]} #{h value}#{h options[:suffix]}</span>", :class => options[:css]) unless value.blank?
  end

  def gravatar_for(user, options = { :size => 50 })
    image_tag user.gravatar_url(options), :class => "gravatar", :alt => user.nome
  end

  protected
    def extract_params_id
      return '' unless params[:id].present?
      params[:id].gsub('/', ' ')
    end
end
