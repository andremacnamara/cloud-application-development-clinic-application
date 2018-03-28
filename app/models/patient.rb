class Patient < ActiveRecord::Base
    
    include Tire::Model::Search
    include Tire::Model::Callbacks

    
    validates :name, presence:true
    validates :age, presence:true
    validates :phone, presence:true
    validates :ailment, presence:true
    validates :apointment, presence:true
    validates :status, presence:true
    
    belongs_to :user
    has_many :reports
    
    def to_s
        name
    end
end