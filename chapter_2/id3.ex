defmodule GetMetadata do
  def mp3(filename) do
    case File.read(filename) do
      {:ok, mp3} ->
        # See You On The Otherside - The 126ers.mp3
        mp3_byte_size = byte_size(mp3) - 200

        <<_::binary-size(mp3_byte_size), id3_tag::binary>> = mp3

        <<"TAG", title::binary-size(30), artist::binary-size(30), album::binary-size(30),
          year::binary-size(4), _rest::binary>> = id3_tag

        IO.puts("Song's name: #{title}\nBy: #{artist}\nAlbum: #{album}\nYear: #{year}")

      _ ->
        IO.puts("Cannot read file")
    end
  end
end
