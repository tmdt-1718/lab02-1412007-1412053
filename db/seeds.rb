User.delete_all
Message.delete_all
Friendship.delete_all

user1 = User.create!(name: 'Nguyen Huyen Quy Chau', email:'nguyenhuyenquychau@gmail.com', password: '123')
user2 = User.create!(name: 'Le My Anh', email:'anhle0196@gmail.com', password: '123')
user3 = User.create!(name: '1412012', email:'1412012@gmail.com', password: '123')
user4 = User.create!(name: '1412169', email:'1412169@gmail.com', password: '123')

mes1 = user1.messages.create!(title: 'Mes1', content: 'Đây là mes1', receiverid: user2.id)
mes2 = user1.messages.create!(title: 'Mes2', content: 'Đây là mes2', receiverid: user2.id)
mes3 = user2.messages.create!(title: 'Mes3', content: 'Đây là mes3', receiverid: user1.id)
mes4 = user1.messages.create!(title: 'Mes4', content: 'Đây là mes4', receiverid: user3.id)
