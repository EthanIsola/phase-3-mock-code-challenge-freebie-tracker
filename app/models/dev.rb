class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        true_or_false = nil
        self.freebies.map do |freebie|
            if freebie.item_name == item_name
                true_or_false = true
                break
            else
                true_or_false = false 
            end
        end
        true_or_false
    end

    def give_away(dev, freebie)
        if freebie.dev_id == self.id
            Freebie.find(freebie.id).update(dev_id: dev.id)
        else
            "Does not belong to you"
        end
    end

end
