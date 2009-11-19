class Participant < ActiveRecord::Base
  attr_accessible :name, :email, :phone
  validates_presence_of :name, :message => "Non puoi lasciare in bianco"
end
