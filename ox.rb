
#入力された数値から配列の番地を返す。予想外の数値は−1を返す。
def transnum(inputnum)
    case inputnum
    when 11 then addressnum = 0
    when 12 then addressnum = 1
    when 13 then addressnum = 2
    when 21 then addressnum = 3
    when 22 then addressnum = 4
    when 23 then addressnum = 5
    when 31 then addressnum = 6
    when 32 then addressnum = 7
    when 33 then addressnum = 8
    else puts "指定した場所がありません"
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
turn = ['o','x'].sample
printf("先行は %s です。\n",turn)

while true do

#初期化部
lineup=[0,0,0,0,0,0,0,0]
endflg = false
changeflg = false
blank = 0
#入力部
while true do
    puts "数値を入力してください。（左下 ＝ 31）"
    inputnum = gets.to_i
    addressnum = transnum(inputnum)
    #入力判断
    if 0 <= addressnum && addressnum <= 8
        if board[addressnum] == ' '
            break
        else puts "すでに埋まっています"
        end
    else puts "もう一度入力してく下さい"
    end
end

#演算部
board[addressnum] = turn

#出力部
puts '-------'
for i in 0..board.length-1
    print '|',board[i]
    if i%3 == 2 && 0 < i then puts '|','-------'
    end
end

#終了判断部
for i in 0..board.length-1 #マスが埋まった時の処理
    if board[i] == ' '
        blank+=1
    end
end
#3つ並んだ時の処理
#横
j=0
for i in 0..2 
    if board[i]==turn
        lineup[j]+=1
    end
end
j+=1
for i in 3..5 
    if board[i]==turn 
        lineup[j]+=1
    end
end
j+=1
for i in 6..8 
    if board[i]==turn 
        lineup[j]+=1
    end
end

j+=1
for i in 0..2 
    if board[i*3]==turn 
        lineup[j]+=1
    end
end
j+=1
for i in 0..2 
    if board[i*3+1]==turn 
        lineup[j]+=1
    end
end
j+=1
for i in 0..2 
    if board[i*3+2]==turn 
        lineup[j]+=1
    end
end
#
j+=1
for i in 0..2 
    if board[i*4]==turn 
        lineup[j]+=1
    end
end
j+=1
for i in 1..3 
    if board[i*2]==turn 
        lineup[j]+=1
    end
end

#勝敗判定
for i in 0..lineup.length-1
    if lineup[i]==3
    clearflg=true
    end
end
#ゲーム終了
if clearflg
    printf("%s の勝ちです。\n",turn)
    break
    elsif blank==0
    puts '今回は引き分けです。'
    break
end
#順番切り替え
turn=changeturn(turn)
printf("次は %s です。\n",turn)
end

