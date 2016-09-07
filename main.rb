board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']

puts "数値を入力してください。（真ん中 ＝ 22）"
inputnum = gets.to_i
addressnum=0

def transnum(inputnum,addressnum)
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
    when 34
    addressnum = 8
    else
        puts "指定した場所がありません"
end

transnum(inputnum,addressnum)
board[addressnum]='o'

puts "----------"
for i in 0..9
    if i%3==0
        puts "|","----------"
    end
    print "|"　,  board[i]
end