module ConvertChessNotations
  def change_number_to_array(source)
    row = case source
          when '1'
            0
          when '2'
            1
          when '3'
            2
          when '4'
            3
          when '5'
            4
          when '6'
            5
          when '7'
            6
          when '8'
            7
          else
            -1
          end
    row
  end

  def change_alphabet_to_array(source)
    return source if source.is_a?(Array)

    splited_source = source.split('')
    column = case splited_source[0]
             when 'a'
               0
             when 'b'
               1
             when 'c'
               2
             when 'd'
               3
             when 'e'
               4
             when 'f'
               5
             when 'g'
               6
             when 'h'
               7
             else
               -1
             end
    row = change_number_to_array(splited_source[1])
    [row, column]
  end
end
