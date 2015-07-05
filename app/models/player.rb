class Player < ActiveRecord::Base
  enum position: {
    top: 0,
    jungle: 1,
    middle: 2,
    marksman: 3,
    support: 4
  }

  default_scope { order('handle ASC') }
  belongs_to :team
end
