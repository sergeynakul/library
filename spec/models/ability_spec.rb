require 'rails_helper'

describe 'Ability' do
  subject(:ability) { Ability.new(admin_user) }

  describe 'for superadmin' do
    let(:admin_user) { create(:admin_user, role: 'superadmin') }

    it { should be_able_to :manage, :all }
  end

  describe 'for group admin' do
    let(:admin_user) { create(:admin_user, role: 'group') }

    it { should be_able_to :manage, Group }
    it { should be_able_to :read, ActiveAdmin::Page, name: 'Dashboard', namespace_name: 'admin' }
  end

  describe 'for book admin' do
    let(:admin_user) { create(:admin_user, role: 'book') }

    it { should be_able_to :manage, Book }
    it { should be_able_to :read, ActiveAdmin::Page, name: 'Dashboard', namespace_name: 'admin' }
  end

  describe 'for author admin' do
    let(:admin_user) { create(:admin_user, role: 'author') }

    it { should be_able_to :manage, Author }
    it { should be_able_to :read, ActiveAdmin::Page, name: 'Dashboard', namespace_name: 'admin' }
  end
end
