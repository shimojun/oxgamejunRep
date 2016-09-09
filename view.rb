class View

def start_msg(symbol)
    puts "＝＝＝＝○×ゲーム＝＝＝＝"
    printf("先行は %s です。\n",symbol)
end

def input_order_msg
    puts "数値を入力してください。（左下 ＝ 31）"
end

def input_error_msg(numflg,cellflg)
    if numflg
        puts "指定された場所がありません。"
    else
        if cellflg
            puts "すでに埋まっています。"
        else
            return true
        end
    end
    puts "もう一度入力してください。（右上 ＝ 13）"
    return false
end


def print_cell(symbol,newlineflg)
    if newlineflg 
        puts '|','-------'
    else
        print '|',symbol
    end
end

def next_msg(symbol)
    printf("次は %s です。\n",symbol)
end

def end_msg(clearflg,blank,Win_symbol)
    if clearflg
        printf("%s の勝ちです。\n",Win_symbol)
    elsif blank==0
        puts '今回は引き分けです。'
    end
end

end