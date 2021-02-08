require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  before(:each) do
    assign(:user, User.new(
                    username: 'MyString',
                    given_name: 'MyString',
                    family_name: 'MyString',
                    password_digest: 'MyString',
                    can_log_in: false
                  ))
  end

  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', users_path, 'post' do
      assert_select 'input[name=?]', 'user[username]'

      assert_select 'input[name=?]', 'user[given_name]'

      assert_select 'input[name=?]', 'user[family_name]'

      assert_select 'input[name=?]', 'user[password_digest]'

      assert_select 'input[name=?]', 'user[can_log_in]'
    end
  end
end
