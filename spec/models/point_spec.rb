require 'rails_helper'

describe Point, type: :model do
  describe 'validates' do
    it 'presence of user_id' do
      point = Point.new(status: 0)

      expect(point).to_not be_valid
    end
  end
end
