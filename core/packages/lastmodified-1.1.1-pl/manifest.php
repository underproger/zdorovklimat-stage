<?php return array (
  'manifest-version' => '1.1',
  'manifest-attributes' => 
  array (
    'changelog' => 'Changelog for LastModified

=======
1.1.1-pl - 2022-12-29
=====================
- Remove some redundant empty value checks
- Update README file
- Some improvements

1.1.0-pl - 2021-12-14
=====================
- Add exclude by id setting
- Refactor plugin code and logic
- Update README information and settings
- Update code style
- Some improvements

1.0.10-pl
==============
- Add clear cache for all updated documents on OnDocFormSave
- Massive refactoring
- Update .gitignore

1.0.9-pl
==============
- Add contexts support
- Some improvements

1.0.8-pl
==============
- Add prevent on session variables names

1.0.7-pl
==============
- Add prevent handling for authorized users
- Some improvements

1.0.6-pl
==============
- Add update start page
- Some improvements

1.0.5-pl
==============
- Add update nesting level

1.0.4-pl
==============
- Parent 0 bugfix
- Some improvements

1.0.3-pl
==============
- Add update parent editedon functionality
- Some phpdoc annotation update

1.0.2-pl
==============
- Add response directive option
- Update lexicon files and docs
- Some improvements

1.0.1-pl
==============
- Add maxage and expires options
- Add HTTP protocol version
- Update lexicon files and docs

1.0.0-pl
==============
- Initial release
',
    'license' => 'MIT License

Copyright (c) 2018 Sergey Kudashev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
',
    'readme' => '--------------------
LastModified
--------------------
Author: Kudashev Sergey <kudashevs@gmail.com>
--------------------

This MODx Revolution plugin handles If-Modified-Since request header and returns Last-Modified response header
with the response code 304 when it is necessary (more info and site check on https://last-modified.com/en/)

--------------------
Feel free to suggest ideas/improvements/bugs on GitHub:
https://github.com/kudashevs/LastModified/issues
',
  ),
  'manifest-vehicles' => 
  array (
    0 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modNamespace',
      'guid' => '94364571481036308fb54ff51642ee8b',
      'native_key' => 'lastmodified',
      'filename' => 'modNamespace/3314ed2d6c8bb5c569b794d6ac3e6000.vehicle',
      'namespace' => 'lastmodified',
    ),
    1 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '6408588ec121bb7484291e97cd3081e6',
      'native_key' => 'lastmodified.response',
      'filename' => 'modSystemSetting/c9843458bf3c55497db464e1ca04b723.vehicle',
      'namespace' => 'lastmodified',
    ),
    2 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '604c2f8d9418ec8f04aea24fc7511c48',
      'native_key' => 'lastmodified.maxage',
      'filename' => 'modSystemSetting/047be648d225ce93fca926eb3e6ae326.vehicle',
      'namespace' => 'lastmodified',
    ),
    3 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '1e13e2b44c2976201dfdb1c6e2c417d4',
      'native_key' => 'lastmodified.expires',
      'filename' => 'modSystemSetting/72fb67bfde51db9010da6bf886c27717.vehicle',
      'namespace' => 'lastmodified',
    ),
    4 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '628d88d33188aeb5438010f80182521c',
      'native_key' => 'lastmodified.update_parent',
      'filename' => 'modSystemSetting/04da27547246f53b6d18f470e1eb7bae.vehicle',
      'namespace' => 'lastmodified',
    ),
    5 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'd11cd6e75e296d67418de23508aadb4a',
      'native_key' => 'lastmodified.update_level',
      'filename' => 'modSystemSetting/9b95a3f010c3495f2a0c231b7d408f0f.vehicle',
      'namespace' => 'lastmodified',
    ),
    6 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '83fc540f563dd2ad6c3c025e7fcfec9d',
      'native_key' => 'lastmodified.update_start',
      'filename' => 'modSystemSetting/16e73d625e9c57235d0cf7f8b6e31dda.vehicle',
      'namespace' => 'lastmodified',
    ),
    7 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'bf2d0a7f6af4e69c724b8df6632ded8d',
      'native_key' => 'lastmodified.prevent_authorized',
      'filename' => 'modSystemSetting/a44dc7a5daf7f53ea4c7265744c8b975.vehicle',
      'namespace' => 'lastmodified',
    ),
    8 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '7c48b7e1dafe56c69d2484678bb41bc3',
      'native_key' => 'lastmodified.prevent_session',
      'filename' => 'modSystemSetting/8286170ee6b899efec19cc73ab7a603c.vehicle',
      'namespace' => 'lastmodified',
    ),
    9 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '147d6246596d18eba7055e6ef74bb494',
      'native_key' => 'lastmodified.exclude',
      'filename' => 'modSystemSetting/f76b8dd9598e1d3e2234c09227e2b1ed.vehicle',
      'namespace' => 'lastmodified',
    ),
    10 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modCategory',
      'guid' => '3e79afef02f106b589b33146e92fa9a8',
      'native_key' => NULL,
      'filename' => 'modCategory/571edf8e9793d7703b25fcff7972b279.vehicle',
      'namespace' => 'lastmodified',
    ),
  ),
);