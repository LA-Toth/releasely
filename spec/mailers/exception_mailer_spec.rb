require 'rails_helper'

RSpec.describe ExceptionMailer, type: :mailer do
  describe 'inform_exception' do
    let(:mail) { ExceptionMailer.inform_exception }

    it 'renders the headers' do
      expect(mail.subject).to eq('Inform exception')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
