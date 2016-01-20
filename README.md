## NCDateTimeSelector
* 自用日期时间选择器

## How To Use

* 初始化

```objc
_dateTimeSelectView = [[NCDateTimeSelectView alloc] init];
_dateTimeSelectView.delegateGetDate = self;
[self.view addSubview:_dateTimeSelectView];
```

* 代理方法

```objc
- (void)getDate:(NSMutableDictionary *)dictDate {
    NSLog(@"Data：%@", dictDate);
}

- (void)cancelDate {
    _dateTimeSelectView.hidden = YES;
}
```