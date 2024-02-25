class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: 'おもちゃ・ホビー・グッズ' },
    { id: 8, name: '家電・スマホ・カメラ' },
    { id: 9, name: 'スポーツ・レジャー' },
    { id: 10, name: 'ハンドメイド' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :products
end

class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '新品・未使用' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: '目立った傷や汚れなし' },
    { id: 5, name: 'やや傷や汚れあり' },
    { id: 6, name: '傷や汚れあり' },
    { id: 7, name: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :products
end

class ShippingCostResponsibility < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い(購入者負担)' },
    { id: 3, name: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :products
end  

class ShippingFromRegion < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '北海道' },
    { id: 3, name: '青森県' },
    # 他の都道府県のデータ
    { id: 48, name: '沖縄県' }
  ]
  
  include ActiveHash::Associations
  has_many :products
end


class DaysUntilShipment < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2日で発送' },
    { id: 3, name: '2~3日で発送' },
    { id: 4, name: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :products
end
