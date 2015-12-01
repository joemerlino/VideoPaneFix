%hook VideoPaneWindowContentView
- (void)layoutSubviews{
	//get the videopane window
	UIWindow * darkeningView = MSHookIvar<UIWindow*>(self,"window");
	//if it's in landscape
	if((long)[[UIDevice currentDevice] orientation] == 3 || (long)[[UIDevice currentDevice] orientation] == 4){
		//switch width with height
		if(darkeningView.bounds.size.height > darkeningView.bounds.size.width){
			darkeningView.center = CGPointMake(darkeningView.center.y, darkeningView.center.x);
			darkeningView.bounds = CGRectMake(0, 0, darkeningView.bounds.size.height, darkeningView.bounds.size.width);
		}
	}
	else if(darkeningView.bounds.size.width > darkeningView.bounds.size.height){
		darkeningView.center = CGPointMake(darkeningView.center.y, darkeningView.center.x);
		darkeningView.bounds = CGRectMake(0, 0, darkeningView.bounds.size.height, darkeningView.bounds.size.width);
	}
	%orig;
}
%end