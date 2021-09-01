//
let skeleton1 = Enemy(health: 100, attackStrength: 10)
let skeleton2 = skeleton1
let skeleton3 = Enemy(health: 200, attackStrength: 20)
//
//skeleton.move()
//skeleton.attack()

//let dragon = Dragon(health: 300, attackStrength: 20)
//dragon.wingSpan = 5
//dragon.attackStrength = 15
//dragon.talk(speech: "My teeth are swords!")
//dragon.move()
//dragon.attack()

skeleton1.takeDamage(amount: 10)

print(skeleton2.health)
print(skeleton3.health)


