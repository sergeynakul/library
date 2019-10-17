require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should belong_to :group }
  it { should have_and_belong_to_many :authors }

  it { should validate_presence_of :title }

  it 'have one attached picture' do
    expect(Book.new.picture).to be_an_instance_of(ActiveStorage::Attached::One)
  end
end
