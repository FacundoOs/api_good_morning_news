require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have valid factory' do
    expect(FactoryBot.create(:user)).to be_valid
  end
  
  describe 'Database table' do
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :tokens }
    it { is_expected.to have_db_column :journalist }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
  end

  context 'should not have an invalid email address' do
    emails = ['ayaf@ dt.com', '@example.com', 'test me @yao.com',
              'asaf@example', 'ddd@.d. .d', 'ddd@.d']

    email.each do |email|
      it { is_expected.not_to allow_value(email).for(:email) }
    end
  end

  context 'should have a valid email address' do
    emails = ['ayaf@dt.com', 'jenny@example.com', 'testme@yao.com',
              'asaf@example.com']
              
    email.each do |email|
      it { is_expected.to allow_value(email).for(:email) }
    end     
  end
end
