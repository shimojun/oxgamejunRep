require './view.rb'
require './chack.rb'


class Board
@symbol = ['o','x'].sample
@inputnum = -1
@clearflg=false
@brank=9
def initialize
    board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    view = View.new()
    chack = Chack.new()
end

#入力された数値から配列の番地を返す。予想外の数値は−1を返す。
def transnum
    case @inputnum
    when 11 then addressnum = 0
    when 12 then addressnum = 1
    when 13 then addressnum = 2
    when 21 then addressnum = 3
    when 22 then addressnum = 4
    when 23 then addressnum = 5
    when 31 then addressnum = 6
    when 32 then addressnum = 7
    when 33 then addressnum = 8
    else return -1
    end
    return  addressnum
end
#番地を指定する
def input_number
    view.input_order_msg
    @inputnum = gets.to_i
end
#要素にいれる
def insert_symbol
    board[addressnum] = @symbol
end
#turnの反対を返す
def changesymbol
    if @symbol=='o' 
    return 'x'
    elsif @symbol=='x' 
    return 'o'
    end
end

#始めの処理
def start_session
    view.start_msg(@symbol)
end


#入力処理
def input_session
    #入力ループ
    while true do
        input_number
        addressnum = transnum
        numflg = chack.input_number_chack(addressnum)
        cellflg = chack.input_cell_chack(addressnum)
        #(false,false)だったらエラーメッセージを表示しない
        if  view.input_error_msg( numflg , cellflg )
        break
        end
    end
    #格納
    insert_symbol
end

#表示処理　マスめを表示
def print_board_session
    puts '-------'
    for i in 0..board.length-1
        if i%3 == 2 && 0 < i #３マス目で改行
            view.print_cell( board[i] ,true)
        else
            view.print_cell( board[i] ,false)
        end
    end
end

#終了処理　引き分けか勝敗を分けて
def end_session
    @clearflg = chack.clear_chack
    chack.fully_chack(@blank)
    if end_chack(@clearflg,@blank)
        view.end_msg(@clear,@brank,@symbol)
        return true
    end
    return false
end

 #次のターンの切り替え
def next_session
    @clearflg=false
    @brank=9
    changesymbol
    view.next_msg(@symbol)
end

end