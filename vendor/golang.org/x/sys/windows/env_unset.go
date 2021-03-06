// Copyright 2018  The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// +build windows
// +build go1.4

package windows

import "syscall"

func Unsetenv(key string) error {
	// This was added in Go 1.4.
	return syscall.Unsetenv(key)
}
