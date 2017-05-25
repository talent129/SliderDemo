# SliderDemo

# 进度条

[self addSubview:self.percentageLabel];
self.percentageLabel.frame = CGRectMake(10, (rect.size.height - 20)/2.0, rect.size.width - 20, 20);
self.percentageLabel.text = [NSString stringWithFormat:@"%.2f%%", self.percentage * 100];

//上下文
CGContextRef ref = UIGraphicsGetCurrentContext();

//创建路径
//圆心
CGPoint centerP = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);

//半径
CGFloat r = MIN(rect.size.width, rect.size.height) * 0.5 - 5;

//起始弧度
CGFloat start = -M_PI_2;

//终止弧度
CGFloat end = (M_PI * 2) * self.percentage - M_PI_2;

UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centerP radius:r startAngle:start endAngle:end clockwise:YES];

//关闭路径
//    [path closePath];

//到圆心连线
[path addLineToPoint:centerP];

//设置线宽
CGContextSetLineWidth(ref, 10);
//设置线颜色
[[UIColor redColor] set];
//设置圆角
CGContextSetLineCap(ref, kCGLineCapRound);

//路径添加到上下文
CGContextAddPath(ref, path.CGPath);

//渲染
CGContextDrawPath(ref, kCGPathFill);
