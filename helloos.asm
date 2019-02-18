;hello-os

;フロッピー用初期設定

    DB      0xeb, 0x4e, 0x90
    DB      "HELLOTEC"      ; ブートセクタの名前を自由に書いてよい（8バイト）
    DW      512             ; 1セクタの大きさ（512にしなければいけない）
    DB      1               ; クラスタの大きさ（1セクタにしなければいけない）
    DW      1               ; FATがどこから始まるか（普通は1セクタ目からにする）
    DB      2               ; FATの個数（2にしなければいけない）
    DW      224             ; ルートディレクトリ領域の大きさ（普通は224エントリにする）
    DW      2880            ; このドライブの大きさ（2880セクタにしなければいけない）
    DB      0xf0            ; メディアのタイプ（0xf0にしなければいけない）
    DW      9               ; FAT領域の長さ（9セクタにしなければいけない）
    DW      18              ; 1トラックにいくつのセクタがあるか（18にしなければいけない）
    DW      2               ; ヘッドの数（2にしなければいけない）
    DD      0               ; パーティションを使ってないのでここは必ず0
    DD      2880            ; このドライブ大きさをもう一度書く
    DB      0,0,0x29        ; よくわからないけどこの値にしておくといいらしい
    DD      0xffffffff      ; たぶんボリュームシリアル番号
    DB      "HELLO-OS   "   ; ディスクの名前（11バイト）
    DB      "FAT12   "      ; フォーマットの名前（8バイト）
    TIMES   18 DB 0         ; とりあえず18バイトあけておく(本とは異なる命令を用いている)

; プログラム本体

    DB      0xb8, 0x00, 0x00, 0x8e, 0xd0, 0xbc, 0x00, 0x7c
    DB      0x8e, 0xd8, 0x8e, 0xc0, 0xbe, 0x74, 0x7c, 0x8a
    DB      0x04, 0x83, 0xc6, 0x01, 0x3c, 0x00, 0x74, 0x09
    DB      0xb4, 0x0e, 0xbb, 0x0f, 0x00, 0xcd, 0x10, 0xeb
    DB      0xee, 0xf4, 0xeb, 0xfd

; メッセージ表示部分

    DB      0x0a, 0x0a      ;改行x2
    DB      "hello, work."  ;12byte
    DB      0x0a            ;改行x1
    DB      0

    TIMES   0x1fe-($-$$) DB 0   ;0x1feまで0で繰り返し埋める（本とは異なる）

    DB      0x55, 0xaa

; ブートセクタ以外の記述らしい（よくわからない）
    DB      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    TIMES   4600 DB 0
    DB      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    TIMES   1469432 DB 0