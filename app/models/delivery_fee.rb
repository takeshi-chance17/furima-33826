class DeliveryFee < ActiveHash::Base
    self.data = [
    { id: 1, name: '--' },
    { id: 6, name: 'IT' },
    { id: 7, name: 'エンタメ' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: 'グルメ' },
    { id: 10, name: 'その他' }
]
    include ActiveHash::Associations
    has_many :items
end