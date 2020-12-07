# frozen_string_literal: true

module ConvertChessNotations
  def change_number_to_array(source)
    source.to_i - 1
  end

  def change_alphabet_to_array(source)
    return source if source.is_a?(Array)

    coord = source.split('')
    column = coord[0].ord - 97
    row = change_number_to_array(coord[1])
    [row, column]
  end
end
