require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  let!(:user) { create(:user) }
  let!(:contact) { create(:contact, user_id: user.id) }

  describe 'お問い合わせ機能' do
    context 'お問い合わせ内容が作成された場合' do
      # Ⓜ︎system specではない→User単体なのでここでのUserとの紐づき確認なし
      # before do
      #   login(user)
      # end
      
      # Mailerクラスのメソッドを実行
      subject(:mail) do
        # described_class(describeのクラスで宣言されあtクラスを取得)＝ContactMailer
        described_class.contact_mail(contact).deliver_now
        ActionMailer::Base.deliveries.last
      end
      after(:all) do
        ActionMailer::Base.deliveries.clear
      end

      it '管理者に問い合わせのメールが届く' do
        expect(mail.to.first).to eq('kannrisya@co.jp')
        expect(mail.subject).to eq('問い合わせがありました')
        expect(mail.body).to match("#{user.email}")
      end
    end
  end
end
