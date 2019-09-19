# iOS-UIButton-Delay
iOS UIButton 防止短时间内重复点击

UIButton 点击一次的响应为

1. 按下  （UIControlEventTouchDown）

2. 按钮移动 （UIControlEventTouchDragInside）

3. 抬起  （UIControlEventTouchUpInside | UIControlEventTouchUpOutside）

4. 取消手势 （UIControlEventTouchCancel）

防止短时间内重复点击，原理应该是UIButton两次（1.按下）之间有时间间隔，而不能阻止一次完整的事件响应（从1.按下，到3抬起，或取消）。所以在抬起、或取消 （3或者4）之后，让按钮不可响应userInteractionEnabled= NO。
