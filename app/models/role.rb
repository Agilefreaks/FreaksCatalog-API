# frozen_string_literal: true

class Role < ApplicationRecord
  belongs_to :freak, optional: true
end
