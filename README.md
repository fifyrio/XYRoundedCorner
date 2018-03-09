# XYRoundedCorner
异步渲染圆角，避免离屏渲染

# 如何使用
导入```#import "XYRoundedCorner.h"```

### UIView
```
[yourView xy_setXYRadius:XYRadiusMake(topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius) size:yourView.bounds.size borderColor:[UIColor redColor] borderWidth:1 backgroundColor:[UIColor yellowColor]];
```

### UILabel
```
[yourLabel xy_setXYRadius:XYRadiusMake(topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius) size:yourLabel.bounds.size borderColor:[UIColor redColor] borderWidth:1 backgroundColor:[UIColor yellowColor]];
```

### UIImage
```
[yourImage xy_setXYRadius:XYRadiusMake(topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius) size:yourImage.bounds.size borderColor:[UIColor redColor] borderWidth:1 backgroundColor:[UIColor yellowColor]];
```




