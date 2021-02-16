require 'active_support/concern'
module SuggestModelConcern
  extend ActiveSupport::Concern

  def reject_blank(attributes)
    exists = attributes[:id].present?
    empty = attributes[:image].blank?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end
end
