RSpec.describe 'Vegetable' do
  describe '野菜の登録' do
    it '登録した野菜の情報が返ってくること' do
      expect {
        post vegetables_path, params: { name: 'ブロッコリー' }
      }.to change(Vegetable, :count).by(1)
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq(
        {
          vegetable: {
            id: Vegetable.last.id,
            name: 'ブロッコリー'
          }
        }
      )
    end

    context '野菜の名前が nil の場合' do
      it 'エラーを返すこと' do
        expect {
          post vegetables_path, params: { name: nil }
        }.not_to change(Vegetable, :count)
        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body).deep_symbolize_keys).to eq(
          errors: [
            { message: '野菜の名前を入力してください' }
          ]
        )
      end
    end
  end

  describe '野菜の一覧' do
    it '登録した野菜の情報が全て返ってくること' do
      vegetable_1 = Vegetable.create(name: 'トマト')
      vegetable_2 = Vegetable.create(name: '大葉')

      get vegetables_path

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq(
        {
          vegetables: [
            {
              id: vegetable_1.id,
              name: vegetable_1.name
            },
            {
              id: vegetable_2.id,
              name: vegetable_2.name
            }
          ]
        }
      )
    end
  end
end
