require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               username: 'Username',
               given_name: 'Given Name',
               family_name: 'Family Name',
               password_digest: 'Password Digest',
               can_log_in: false
             ),
             User.create!(
               username: 'Username',
               given_name: 'Given Name',
               family_name: 'Family Name',
               password_digest: 'Password Digest',
               can_log_in: false
             )
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Username'.to_s, count: 2
    assert_select 'tr>td', text: 'Given Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Family Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Password Digest'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
