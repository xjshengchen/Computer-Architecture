實作:
首先先判斷一下運算子，若為錯誤的運算子則呼叫RE函式，若是在除法時發現除數為0也呼叫RE，RE函式內部會先將output_ascii改為4個'X'，再呼叫ret將答案寫進文件。計算完值之後進入itoa，將結果轉成4個byte存在output_ascii內，讓答案寫進目標文件裡。

編寫的平台:
Windows