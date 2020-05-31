describe Artist do
  it { should have_many(:albums).through(:album_artists)}
end