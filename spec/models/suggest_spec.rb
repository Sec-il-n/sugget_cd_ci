require 'rails_helper'
describe '提案/プロジェクト機能', type: :model do
  describe '入力項目バリデーション' do
    context 'タイトルが未入力の際' do
      it 'バリデーションに引っかかる'do
        suggest = FactoryBot.build(:suggest, title:'')
        suggest.valid?
        expect(suggest.errors.full_messages).to include('タイトルが未入力です')
      end
    end
    context '詳細が未入力の際' do
      it 'バリデーションに引っかかる'do
      suggest = FactoryBot.build(:suggest, details:'')
      suggest.valid?
      expect(suggest.errors.full_messages).to include('詳細が未入力です')
      end
    end
    context 'タイトルと詳細が入力されている際' do
      it 'バリデーションに通る'do
        suggest = FactoryBot.build(:suggest)
        expect(suggest).to be_valid
      end
    end
  end
  describe '検索機能' do
    let!(:suggests) { FactoryBot.create_list(:suggest_1, 20) }
    before do
      suggests
    end
    context 'scope :category_search でカテゴリ検索した際' do
      it '指定したカテゴリに絞り込まれる' do
        results_3 = Suggest.category_search(3).map(&:category)
        results_5 = Suggest.category_search(5).map(&:category)
        results_7 = Suggest.category_search(7).map(&:category)
        results_3.each do |result_3|
          expect(result_3.name).to eq('食品加工業')
        end
        results_5.each do |result_5|
          expect(result_5.name).to eq('小売業')
        end
        results_7.each do |result_7|
          expect(result_7.name).to eq('運輸業')
        end
      end
    end
  end
end
