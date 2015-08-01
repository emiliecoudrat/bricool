class Bricooler < ActiveRecord::Base
  has_one :user, :as => :profileable
end
