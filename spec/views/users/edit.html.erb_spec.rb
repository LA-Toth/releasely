require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            username: 'MyString',
                            given_name: 'MyString',
                            family_name: 'MyString',
                            password_digest: 'MyString',
                            can_log_in: false
                          ))
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input[name=?]', 'user[username]'

      assert_select 'input[name=?]', 'user[given_name]'

      assert_select 'input[name=?]', 'user[family_name]'

      assert_select 'input[name=?]', 'user[password_digest]'

      assert_select 'input[name=?]', 'user[can_log_in]'
    end
  end
end
