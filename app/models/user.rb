class User < ApplicationRecord
    #bundleでbycriptインストールしたので使用
 has_secure_password

 #bookモデルにuser(user_id)がたくさんいることを示す
 #1対他の関係を示したい
 #bookモデルにはbelong_toで所属をしめす
 has_many :books

#lengthが長さ制限、uniquenessが同じものがないようにする
 validates :name, presence: true,length:{maximum:20}
 validates :email, presence: true,uniqueness:true,length:{maximum:50}

end
