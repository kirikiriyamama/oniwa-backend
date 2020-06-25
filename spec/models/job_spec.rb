RSpec.describe Job do
  it '作業の名前を登録できること' do
    job = Job.create(name: '草むしり')

    expect(job.name).to eq '草むしり'
  end
end
