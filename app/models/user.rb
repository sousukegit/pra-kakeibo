class User < ApplicationRecord
    #bundleでbycriptインストールしたので使用
 has_secure_password
#lengthが長さ制限、uniquenessが同じものがないようにする
 validates :name, presence: true,length:{maximum:20}
 validates :email, presence: true,uniqueness:true,length:{maximum:50}

end
