//
//  SelectionControl.m
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "SelectionControl.h"

#define kLabelTag   222
#define defaultBG   [UIColor whiteColor]
#define defaultText [UIColor blackColor]

@implementation SelectionControl{
    UILabel *_textLabel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.layer.cornerRadius = 16.0f;
        self.layer.borderWidth = 2.0f;
        self.layer.borderColor = [defaultText CGColor];
        self.clipsToBounds = YES;
        CGRect frame = self.frame;
        frame.origin = CGPointZero;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:frame];
        [textLabel setTag:kLabelTag];
        [textLabel setTextAlignment:NSTextAlignmentCenter];
        textLabel.text = self.text;
        [self addSubview:textLabel];
        
        [self setIsSelected:NO];
        
        [self setColor];
        UITapGestureRecognizer *singleFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(handleSingleTap:)];
        
        [textLabel setUserInteractionEnabled:YES];
        [textLabel addGestureRecognizer:singleFingerTap];
    }
    return self;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer{
    self.isSelected = !self.isSelected;
    [self setColor];
    
    if (self.delegate) {
        if (self.isSelected && [self.delegate respondsToSelector:@selector(selectedController:)]) {
            [self.delegate selectedController:self.text];
        }
        else if (!self.isSelected && [self.delegate respondsToSelector:@selector(deselectedController:)]) {
            [self.delegate deselectedController:self.text];
        }
    }
}

- (void)setColor{
    UILabel *label = (UILabel *)[self viewWithTag:kLabelTag];
    [label setTextColor:[self labelColor]];
    [label setBackgroundColor:[self backgroundColor]];
}

- (UIColor *)backgroundColor{
    return self.isSelected ? defaultText : defaultBG;
}

- (UIColor *)labelColor{
    return self.isSelected ? defaultBG : defaultText;
}


@end
