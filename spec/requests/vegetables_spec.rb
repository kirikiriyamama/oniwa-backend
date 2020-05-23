RSpec.describe 'Vegetable' do
  describe '野菜の登録' do
    it '登録した野菜の情報が返ってくること' do
      expect {
        post vegetables_path, params: { name: 'ブロッコリー' }
      }.to change(Vegetable, :count).by(1)
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['vegetable']['id']).to eq Vegetable.last.id
      expect(JSON.parse(response.body)['vegetable']['name']).to eq 'ブロッコリー'
    end

    context '野菜の名前が nil の場合' do
      it 'エラーを返すこと' do
        expect {
          post vegetables_path, params: { name: nil }
        }.not_to change(Vegetable, :count)
        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body)['errors'][0]['message']).to eq '野菜の名前を入力してください'
      end
    end
  end
end
