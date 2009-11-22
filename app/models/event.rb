class Event < ActiveRecord::Base
  default_scope :order => 'starts_at'
  has_many :talks, :order => 'starts_at'

  def to_param
    id.to_s + '-' + name.downcase.gsub(/\s/, '-')
  end
end
