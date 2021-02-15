require "rails_helper"

RSpec.describe ContactConfMailer, type: :mailer do
  let!(:user) { create(:user) }
  let!(:contact) { create(:contact, user_id: user.id) }
  describe 'お問い合わせ機能' do
    context 'お問い合わせ内容が作成された場合' do
      # Mailerクラスのメソッドを実行
      subject(:mail) do
        # described_class(describeのクラスで宣言されあtクラスを取得)＝ContactMailer
        described_class.contact_conf(contact).deliver_now
        ActionMailer::Base.deliveries.last
      end
      after(:all) do
        ActionMailer::Base.deliveries.clear
      end

      it '問い合わせ投稿者に完了のメールが届く' do
        kannri = Rails.application.credentials.dig(:gmail, :user_name)
        expect(mail.from.first).to eq(kannri)
        expect(mail.subject).to eq('以下の内容で、お問い合わせを受け付けました')
        expect(mail.body).to match("#{user.email}様")
        expect(mail.body).to match('3営業日内にご連絡いたします。')
      end
    end
  end
end
