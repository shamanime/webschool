# encoding: utf-8
class CoordenadorDecorator < Draper::Decorator
  delegate_all
  # decorates :coordenador

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def status
    status = ativo? ? 'Ativo' : 'Inativo'
    cor = ativo? ? 'success' : 'warning'
    h.content_tag :span, status, :class => "label label-#{cor}"
  end
end
