/*
 * Copyright (C) 2010 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <linux/input.h>

#include "recovery_ui.h"
#include "common.h"
#include "extendedcommands.h"

//Spica codes
#undef KEY_HOME
#define KEY_HOME 227
#undef KEY_END
#define KEY_END 249
#undef KEY_VOLUMEDOWN
#define KEY_VOLUMEDOWN 209
#undef KEY_VOLUMEUP
#define KEY_VOLUMEUP 201
#undef KEY_MENU
#define KEY_MENU 211
#undef KEY_BACK
#define KEY_BACK 212
#undef KEY_DOWN
#define KEY_DOWN 210
#undef KEY_UP
#define KEY_UP 202
#undef KEY_SEND
#define KEY_SEND 204

int device_toggle_display(volatile char* key_pressed, int key_code) {
    // hold power and press volume-up
    return key_pressed[KEY_POWER] && key_code == KEY_VOLUMEUP;
}

int device_handle_key(int key_code, int visible) {
    if (visible) {
        switch (key_code) {
            case KEY_DOWN:
            case KEY_VOLUMEDOWN:
                return HIGHLIGHT_DOWN;

            case KEY_UP:
            case KEY_VOLUMEUP:
                return HIGHLIGHT_UP;

            case KEY_SEND:
            case KEY_MENU:   // crespo power
                return SELECT_ITEM;

            case KEY_BACK:
            case KEY_END:
                return GO_BACK;
        }
    }

    return NO_ACTION;
}
