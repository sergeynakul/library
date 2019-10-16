require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should belong_to :group }
  it { should have_and_belong_to_many :authors }

  it { should validate_presence_of :title }
end
