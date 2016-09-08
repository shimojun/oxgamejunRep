#入力された数値から配列の番地を返す。予想外の数値は−1を返す。
def transnum(inputnum)
    case inputnum
        when 11
        addressnum = 0
        when 12
        addressnum = 1
        when 13
        addressnum = 2
        when 21
        addressnum = 3
        when 22
        addressnum = 4
        when 23
        addressnum = 5
        when 31
        addressnum = 6
        when 32
        addressnum = 7
        when 33
        addressnum = 8
        else
            puts "指定した場所がありません"
            return -1
    end
    return  addressnum
end

#turnの反対を返す
def changeturn(turn)
    if turn=='o'
        return 'x'
    elsif turn=='x'
        return 'o'
    end
end

#mainの処理
board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
turn = 'o'
print "先行は",turn,"です。¥n"

while true do 

    #初期化部
        lineup=[0,0,0,0,0,0,0,0]
        addressnum = -1
        endflg = false
    #入力部
    while true do
        puts "数値を入力してください。（左下 ＝ 31）"
        inputnum = gets.to_i
        addressnum=transnum(inputnum)
        if board[addressnum]==' ' || addressnum==-1
            break
        else
            puts "もう一度入力してく下さい"
        end
    end

    #演算部
    board[addressnum]=turn

    #出力部
    puts '-------'
    for i in 0..board.length
        print "|",board[i]
        if i%3==2 && 0<i
            puts '|','-------'
        end
    end
    #判断部
    for i in 0..board.length #マスが埋まった時の処理
        if board[i]==' '
            endflg=false
            break
        else
            endflg=true
        end 
    end


    #3つ並んだ時の処理
    #横
    j=0
    for i in 0..3
        if board[i]==turn
            lineup[j]+=1
        end
    end
    j+=1
    for i in 3..6
        if board[i]==turn
            lineup[j]+=1
        end
    end
    j+=1
    for i in 6..9
        if board[i]==turn
            lineup[j]+=1
        end
    end
    #縦
    j+=1
    for i in 0..3
        if board[i*3]==turn
            lineup[j]+=1
        end
    end
    j+=1
    for i in 0..3
        if board[i*3+1]==turn
            lineup[j]+=1
        end
    end    
    j+=1
    for i in 0..3
        if board[i*3+2]==turn
            lineup[j]+=1
        end
    end
    #斜め
    j+=1
    for i in 0..3
        if board[i*4]==turn
            lineup[j]+=1
        end
    end
    j+=1
    for i in 1..4
        if board[i*2]==turn
            lineup[j]+=1
        end
    end

    for i in 0..lineup.length
        if lineup[i]==3
            print turn,"の勝ちです。¥n"
            endflg=true
        end
    end

    if endflg
    break
    end
    #順番切り替え
    turn=changeturn(turn)
    print "次は",turn,"の番です。"
end