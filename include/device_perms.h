/*
 * Copyright (C) 2013 TripNDroid Mobile Engineering
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

#ifndef DEVICE_PERMS_H
#define DEVICE_PERMS_H

#define PROPERTY_PERMS_APPEND \
    { "sys.under_silent_reset.",  AID_RADIO,    0 }, \
    { "user.language.",  AID_SYSTEM,    0 }, \
    { "user.region.",  AID_SYSTEM,    0 }, \
    { "htc.audio.stream.type.",  AID_MEDIA,    0 }, \
    { "radio.matrace.available.",  AID_RADIO,    0 }, \
    { "media.tegra.max.out.channels.",  AID_MEDIA,    0 }, \
    { "persist.camera.",  AID_MEDIA,    0 }, \
    { "camera.",          AID_MEDIA,    0 },

#endif /* DEVICE_PERMS_H */
