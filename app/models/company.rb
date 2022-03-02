class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        Freebie.new(dev_id: dev.id, item_name: item_name, value: value, company_id: self.id).save
    end

    def self.oldest_company
        self.find_by(founding_year: self.maximum(:founding_year))
    end
end

