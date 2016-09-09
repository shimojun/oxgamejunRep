require './view'
class Chack

attr_accessor :board

def initialize(board)
    lineup=[0,0,0,0,0,0,0,0]#3っつ並んだかどうかの情報用　[１行,2行,3行,1列,2列,3列,右上から左下,左上から右下]
    view=View.new()
end

#入力した数字の判断　0−9以外ならtrueを返す
def input_number_chack(addressnum)
    if addressnum < 0 && 8 < addressnum 
        return true
    end
end
#ますに記号があるかどうか　空いていなかったらtrueを返す
def input_cell_chack(addressnum)
    if board[addressnum] != ' '
        return true
    end
end



def clear_chack
    #勝敗判定　１つでも３なら続いたらtrueを返す
    for i in 0..lineup.length-1
        if lineup[i]==3
        return true
        end
    end
end

#空きマスのチェック
def fully_chack(blank,board = Array.new())
    for i in 0..board.length-1 #マスが埋まった時の処理
        if board[i] == ' '
            blank+=1
        end
    end
end

#決着の確認
def end_chack(clearflg,blank)
    if clearflg || blank==0
    return true
    end
    return false
end


end