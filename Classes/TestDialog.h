//
//  TestDialog.h
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

#import "BYDialog.h"

@protocol TestDialogDelegate;

@interface TestDialog : BYDialog {
  id<TestDialogDelegate> _delegate;
}
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, assign) id<TestDialogDelegate> delegate;

- (id)initWithMessage:(NSString *)message;

- (IBAction)cancel;
- (IBAction)ok;

- (IBAction)popAnotherDialog;

@end

#pragma mark -

@protocol TestDialogDelegate<NSObject>

 @optional
- (void)testDialogDidCancel:(TestDialog *)dialog;
- (void)testDialogDidReturn:(TestDialog *)dialog
                withMessage:(NSString *)message;

@end
