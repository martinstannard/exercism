defmodule PaintByNumber do

  @empty_picture << 0::0 >>

  def palette_bit_size(color_count) do
    bitsize(color_count)
  end

  def empty_picture() do
    @empty_picture
  end

  def test_picture() do
    << 0::2,  1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bs = bitsize(color_count)
    << pixel_color_index::size(bs), picture::bitstring >>
  end

  def get_first_pixel(@empty_picture, _color_count), do: nil

  def get_first_pixel(picture, color_count) do
    bs = bitsize(color_count)
    <<first::size(bs), _rest::bitstring>> = picture
    first
  end

  def drop_first_pixel(@empty_picture, _color_count), do: @empty_picture
  def drop_first_pixel(picture, color_count) do
    bs = bitsize(color_count)
    <<_first::size(bs), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    << picture1::bitstring, picture2::bitstring >>
  end

  defp bitsize(colours), do: do_bitsize(1, colours)
  defp do_bitsize(bits, colours) do
    cond do
      Integer.pow(2, bits) >= colours -> bits
      true -> do_bitsize(bits + 1, colours)
    end
  end
end
