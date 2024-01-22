class Book < ApplicationRecord
    #書き方：validates :カラム名　ルール
    ##presenseは入力必須にする
    validates:year,presence:true
    validates:month,presence:true
    validates:inout,presence:true
    validates:category,presence:true
    validates:amount,presence:true

end
