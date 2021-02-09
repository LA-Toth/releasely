require 'rails_helper'

RSpec.describe 'teams/new', type: :view do
  before(:each) do
    assign(:team, Team.new(
                    name: 'MyString',
                    lead: nil
                  ))
  end

  it 'renders new team form' do
    render

    assert_select 'form[action=?][method=?]', teams_path, 'post' do
      assert_select 'input[name=?]', 'team[name]'

      assert_select 'input[name=?]', 'team[lead_id]'
    end
  end
end
