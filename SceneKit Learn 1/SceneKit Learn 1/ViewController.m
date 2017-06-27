//
//  ViewController.m
//  SceneKit Learn 1
//
//  Created by 潘耀洪 on 2017/5/3.
//  Copyright © 2017年 潘耀洪. All rights reserved.
//

#import "ViewController.h"
#import <SceneKit/SceneKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSceneView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setUpSceneView {

    //创建游戏专用视图
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    //创建一个场景，系统默认是没有的
    scnView.scene = [SCNScene scene];
    //先设置一个颜色看看游戏引擎有没有加载
    scnView.backgroundColor = [UIColor redColor];
    //添加到scnView中去
    [self.view addSubview:scnView];
    //允许用户操作相机
    scnView.allowsCameraControl = YES;


    //创建一个文字节点
//    SCNNode *textNode = [SCNNode node];
//    SCNText *text = [SCNText textWithString:@"库走天涯" extrusionDepth:0.5];
//    textNode.geometry = text;
//    //吧这个文字节点添加到游戏场景的根节点上
//    [scnView.scene.rootNode addChildNode:textNode];

    //创建正方块
    SCNBox *box = [SCNBox boxWithWidth:0.5 height:0.5 length:0.5 chamferRadius:0];
    SCNNode *boxNode = [SCNNode node];
    boxNode.geometry = box;
    boxNode.position = SCNVector3Make(0, 0, -11);//节点位置
    [scnView.scene.rootNode addChildNode:boxNode];

    //创建球体
    SCNSphere *sphere = [SCNSphere sphereWithRadius:0.1];//设置球体半径0.1
    SCNNode *sphereNode = [SCNNode node];
    sphereNode.geometry = sphere;
    sphereNode.position = SCNVector3Make(0, 0, -10);
    [scnView.scene.rootNode addChildNode:sphereNode];


    //创建一个灯光节点
    SCNNode *lightNode = [SCNNode node];
    SCNLight *light = [SCNLight light];

    //点光源设置
//    light.type = SCNLightTypeOmni;//设置灯光类型,点光源
//    lightNode.position = SCNVector3Make(0, 0, 100);//设置光源节点的位置

    //平行光设置
//    light.type = SCNLightTypeDirectional;//平行光,只有方向，没有位置
//    lightNode.rotation = SCNVector4Make(1, 1, 0, -M_PI/2);//照射方向

    //聚焦光源设置
    light.type = SCNLightTypeSpot;
    light.castsShadow = YES;//捕捉阴影
    light.zFar = 11;//最远能照射到的地方，这里是球的地方
    light.spotOuterAngle = 2;//光的发射角度
    lightNode.position = SCNVector3Make(0, 0, 0);//位置


    lightNode.light = light;
    light.color = [UIColor yellowColor];//灯光颜色
    [scnView.scene.rootNode addChildNode:lightNode];

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
