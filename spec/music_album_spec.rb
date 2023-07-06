require_relative '../src/music_album'
require_relative '../src/item'

describe MusicAlbum do
  context 'When testing the MusicAlbum class' do
    it 'should create a new music album' do
      music_album = MusicAlbum.new('2022-10-10')
      music_album.on_spotify = true

      expect(music_album.on_spotify).to eq(true)
      expect(music_album).to be_instance_of(MusicAlbum)
    end

    it 'should return "false" for archived' do
      music_album = MusicAlbum.new('2022-10-10')

      expect(music_album.archived).to eq(false)
    end
  end
end
