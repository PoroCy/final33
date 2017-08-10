//
//  GameScene.swift
//  SpaceEvader
//
//  Created by Teddy Liang on 8/3/17.
//  Copyright © 2017 Teddy Liang. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let hero = SKSpriteNode(imageNamed: "Spaceship")

    let heroSpeed: CGFloat = 100.0
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black
        
        let xCoord = size.width * 0.5
        let yCoord = size.height * 0.5
        
        hero.size.height = 50
        hero.size.width = 50
        
        hero.position = CGPoint(x: xCoord, y: yCoord)
        
        addChild(hero)
        
        
        //Gesture Recognizers
        
        let swipeUp: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedUp))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        
        
        let swipeDown: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedDown))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }
    
    func addMeteor () {
        
        var meteor: Enemy
        
        
        meteor = Enemy(imageNamed: "MeteorLeft")
        
        meteor.size.height = 35
        meteor.size.width = 50
        
        let randomY = random() * ((size.height - meteor.size.height/2)-meteor.size.height/2) + meteor.size.height/2
        
        meteor.position = CGPoint(x: size.width + meteor.size.width/2, y: randomY)
        
        addChild(meteor)
        
        var moveMeteor: SKAction
        
        moveMeteor = SKAction.move(to: CGPoint(x: -meteor.size.width/2, y: randomY), duration: (5.0))
        
        meteor.run(SKAction.sequence([moveMeteor, SKAction.removeFromParent()]))
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addMeteor), SKAction.wait(forDuration: 1.0)])))
        
    }
    //Gesture Actions
    func swipedUp(sender:UISwipeGestureRecognizer){
        
        var actionMove: SKAction
        
        actionMove = SKAction.move(to: CGPoint(x: hero.position.x, y: hero.position.y + heroSpeed), duration: 0.5)
        
        hero.run(actionMove)
    }
    func swipedDown(sender:UISwipeGestureRecognizer){
        
        var actionMove: SKAction
        
        actionMove = SKAction.move(to: CGPoint(x: hero.position.x, y: hero.position.y - heroSpeed), duration: 0.5)
        
        hero.run(actionMove)
    }
    func swipedLeft(sender:UISwipeGestureRecognizer){
        
        var actionMove: SKAction
        
        actionMove = SKAction.move(to: CGPoint(x: hero.position.x - heroSpeed, y: hero.position.y), duration: 0.5)
        
        hero.run(actionMove)
    }
    func swipedRight(sender:UISwipeGestureRecognizer){
        
        var actionMove: SKAction
        
        actionMove = SKAction.move(to: CGPoint(x: hero.position.x + heroSpeed, y: hero.position.y), duration: 0.5)
        
        hero.run(actionMove)
    }
    override func sceneDidLoad() {
    }
    func touchDown(atPoint pos : CGPoint) {
    }
    func touchMoved(toPoint pos : CGPoint) {
    }
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let bullet = SKSpriteNode()
        
        bullet.color = UIColor.blue
        
        bullet.size = CGSize(width: 5, height: 5)
        
        bullet.position = CGPoint(x: hero.position.x, y: hero.position.y)
        
        addChild(bullet)
        
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        let vector = CGVector(dx: -(hero.position.x - touchLocation.x), dy: -(hero.position.y - touchLocation.y))
        
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        
        let projectileAction = SKAction.sequence([
            SKAction.repeat(
                SKAction.move(by: vector, duration: 0.5), count: 10
                //SKAction.wait (forDuration: 0.5),
                //SKAction.removeFromParent()
            )])
        bullet.run(projectileAction)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    func random() -> CGFloat {
        
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        }
    }



