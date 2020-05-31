RSpec.describe Vegetable do
  it '野菜の名前を登録できること' do
    vegetable = Vegetable.create(name: 'ブロッコリー')

    expect(vegetable.name).to eq 'ブロッコリー'
  end
end
