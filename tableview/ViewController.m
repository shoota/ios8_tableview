//
//  ViewController.m
//  tableview
//
//  Created by 熊野修太 on 2015/01/31.
//  Copyright (c) 2015年 anaguma.org. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController {
    @private
    NSArray *cellText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cellText = @[@"hoge",@"foo",@"bar",@"piyo"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//
// UITableViewDelegate
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [cellText count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"FirstViewTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellId
                                                            forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = cellText[indexPath.row];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択されたら選択状態を即解除してハイライトを消す。アニメーションで見た目はウィンク効果がつく。
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    static NSString *detailCellId = @"DetailCellView";
    DetailCellUIViewController *dcvc = [self.storyboard instantiateViewControllerWithIdentifier:detailCellId];
    
    // modalで遷移
    //[self presentViewController:dcvc animated:YES completion:nil];
    
    // push遷移
    [self.navigationController pushViewController:dcvc animated:YES];
    
}

@end
