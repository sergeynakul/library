require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  it { should validate_presence_of :role }
end
