//
//  TestDialog.m
//  BYDialog
//
//  Created by Near Xu on 10-11-11.
//  Copyright 2010 xubenyang.me
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "TestDialog.h"

static int dialogNum = 0;


@implementation TestDialog

@synthesize textField;
@synthesize delegate = _delegate;

#pragma mark -
#pragma mark BYDialog
- (void)loadContentView{
  [[NSBundle mainBundle] loadNibNamed:@"TestDialogContentView" 
                                owner:self
                              options:nil];
}

- (void)willDismissDialog{
  [super willDismissDialog];
  
  [self.textField resignFirstResponder];
}

- (void)willPresentDialog{
  [super willPresentDialog];
  ++dialogNum;
}
- (void)didDismissDialog{
  [super didDismissDialog];
  --dialogNum;
}

- (void)dealloc{
  self.textField = nil;
  
  [super dealloc];
}

#pragma mark -
#pragma mark Public

- (id)initWithMessage:(NSString *)message{
  if (self = [super initWithFrame:CGRectZero]) {
    self.textField.text = message;
  }
  return self;
}

- (IBAction)cancel{
  if ([self.delegate respondsToSelector:@selector(testDialogDidCancel:)]) {
    [self.delegate testDialogDidCancel:self];
  }
  [self dismissAnimated:YES];
}
- (IBAction)ok{
  if ([self.delegate respondsToSelector:@selector(testDialogDidReturn:withMessage:)]) {
    [self.delegate testDialogDidReturn:self withMessage:self.textField.text];
  }
  
  [self dismissAnimated:YES];
}

- (IBAction)popAnotherDialog{
  TestDialog *dialog = [[TestDialog alloc] initWithMessage:[NSString stringWithFormat:@"Dialog: %d", dialogNum]];
  [dialog show];
  [dialog release];
}

@end
