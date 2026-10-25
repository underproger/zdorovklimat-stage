<?php return array (
  'manifest-version' => '1.1',
  'manifest-attributes' => 
  array (
    'changelog' => 'Changelog for SeoFilter.

1.2.1-beta
==============
- Добавлена поддержка значений из других таблиц для ТВ полей

1.2.0-beta
==============
- Добавлена работа для работы полей-слайдеров (недорогие товары и т.д)
- Устранены некоторые ошибки в js и в классе
- Автоматическая генерация названия для новых ссылок при добавлении новых слов
- Лексиконы компонента переведены на английский язык
- Убраны из класса значения по-умолчанию, чтобы не было подстановок на пустых js полях

1.1.3-beta
==============
- Добавлено копирование правил
- Шаблоны для названия ссылки и галочка перегенерировать
- Изменён механизм подсчёта потомков и выборок
- Добавление правил с учётом полей-слайдеров (цена и т.д)
- Две новые настройки для названия ссылки

1.1.2-beta
==============
- Поправлена работа с ТВ-полями

1.1.1-beta
==============
- Соседние вкладки теперь обновляются автоматически
- Мелкие фиксы

1.1.0-beta
==============
- Поправлены лексиконы
- Поправлен js-файл для обработки заголовков
- Убраны лишние комментарии
- Устанены мелкие баги и ошибки

1.0.10-beta
==============
- Добавлены условия для полей в правиле, чтобы создавать определённые страницы
- Добавил поле editedon для правила и комбобокс с выбором страницы
- Поправил подсчёт мин/макс выборок по ТВ значениям
- Мощный апгрейд кода в логике поиска правил, приоритеты для правил
- Добавлен сниппет sfLink для создания ссылки по нескольким правилам

1.0.9-beta
==============
- Новые комбобоксы в словаре, по полю и значению для более быстрого поиска нужных адресов

1.0.8-beta
==============
- Добавил столбик с датой редактирования для словаря

1.0.7-beta
==============
- Вернул добавление слова в словарь, так удобнее
- Сделал нормальную 404-ую страницу при несуществующих страницах (из админки можно проверить страницу по get-параметрам)

1.0.6-beta
==============
- Вывел для редактирования в окнах URL пункты, связанные с выводом меню

1.0.5-beta
==============
- Добавлен контроллёр для редактирования уникальных мета-тегов с фронтенда для каждой страницы
- Добавлена новый класс для связи URL с полями и словами
- Теперь после редактирования поля, слова обновляются все связанные данные

1.0.4-beta
==============
- Добавил функцию выборки минимальных и максимальных значений.
- Добавил prepareSnippet для подстановки обработанных значений в мета-теги

1.0.3-beta
==============
- Исправление ошибок
- Добавил функцию подсчёта. Активировать в настройках. В шаблонах плейсхолдер count

1.0.2-beta
==============
- Конкретно переписана логика компонента

1.0.1-beta
==============
- Добавлена работа со всеми полями

1.0.0-beta
==============
- First Release',
    'license' => 'GNU GENERAL PUBLIC LICENSE
   Version 2, June 1991
--------------------------

Copyright (C) 1989, 1991 Free Software Foundation, Inc.
59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

Everyone is permitted to copy and distribute verbatim copies
of this license document, but changing it is not allowed.

Preamble
--------

  The licenses for most software are designed to take away your
freedom to share and change it.  By contrast, the GNU General Public
License is intended to guarantee your freedom to share and change free
software--to make sure the software is free for all its users.  This
General Public License applies to most of the Free Software
Foundation\'s software and to any other program whose authors commit to
using it.  (Some other Free Software Foundation software is covered by
the GNU Library General Public License instead.)  You can apply it to
your programs, too.

  When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
this service if you wish), that you receive source code or can get it
if you want it, that you can change the software or use pieces of it
in new free programs; and that you know you can do these things.

  To protect your rights, we need to make restrictions that forbid
anyone to deny you these rights or to ask you to surrender the rights.
These restrictions translate to certain responsibilities for you if you
distribute copies of the software, or if you modify it.

  For example, if you distribute copies of such a program, whether
gratis or for a fee, you must give the recipients all the rights that
you have.  You must make sure that they, too, receive or can get the
source code.  And you must show them these terms so they know their
rights.

  We protect your rights with two steps: (1) copyright the software, and
(2) offer you this license which gives you legal permission to copy,
distribute and/or modify the software.

  Also, for each author\'s protection and ours, we want to make certain
that everyone understands that there is no warranty for this free
software.  If the software is modified by someone else and passed on, we
want its recipients to know that what they have is not the original, so
that any problems introduced by others will not reflect on the original
authors\' reputations.

  Finally, any free program is threatened constantly by software
patents.  We wish to avoid the danger that redistributors of a free
program will individually obtain patent licenses, in effect making the
program proprietary.  To prevent this, we have made it clear that any
patent must be licensed for everyone\'s free use or not licensed at all.

  The precise terms and conditions for copying, distribution and
modification follow.


GNU GENERAL PUBLIC LICENSE
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
---------------------------------------------------------------

  0. This License applies to any program or other work which contains
a notice placed by the copyright holder saying it may be distributed
under the terms of this General Public License.  The "Program", below,
refers to any such program or work, and a "work based on the Program"
means either the Program or any derivative work under copyright law:
that is to say, a work containing the Program or a portion of it,
either verbatim or with modifications and/or translated into another
language.  (Hereinafter, translation is included without limitation in
the term "modification".)  Each licensee is addressed as "you".

Activities other than copying, distribution and modification are not
covered by this License; they are outside its scope.  The act of
running the Program is not restricted, and the output from the Program
is covered only if its contents constitute a work based on the
Program (independent of having been made by running the Program).
Whether that is true depends on what the Program does.

  1. You may copy and distribute verbatim copies of the Program\'s
source code as you receive it, in any medium, provided that you
conspicuously and appropriately publish on each copy an appropriate
copyright notice and disclaimer of warranty; keep intact all the
notices that refer to this License and to the absence of any warranty;
and give any other recipients of the Program a copy of this License
along with the Program.

You may charge a fee for the physical act of transferring a copy, and
you may at your option offer warranty protection in exchange for a fee.

  2. You may modify your copy or copies of the Program or any portion
of it, thus forming a work based on the Program, and copy and
distribute such modifications or work under the terms of Section 1
above, provided that you also meet all of these conditions:

    a) You must cause the modified files to carry prominent notices
    stating that you changed the files and the date of any change.

    b) You must cause any work that you distribute or publish, that in
    whole or in part contains or is derived from the Program or any
    part thereof, to be licensed as a whole at no charge to all third
    parties under the terms of this License.

    c) If the modified program normally reads commands interactively
    when run, you must cause it, when started running for such
    interactive use in the most ordinary way, to print or display an
    announcement including an appropriate copyright notice and a
    notice that there is no warranty (or else, saying that you provide
    a warranty) and that users may redistribute the program under
    these conditions, and telling the user how to view a copy of this
    License.  (Exception: if the Program itself is interactive but
    does not normally print such an announcement, your work based on
    the Program is not required to print an announcement.)

These requirements apply to the modified work as a whole.  If
identifiable sections of that work are not derived from the Program,
and can be reasonably considered independent and separate works in
themselves, then this License, and its terms, do not apply to those
sections when you distribute them as separate works.  But when you
distribute the same sections as part of a whole which is a work based
on the Program, the distribution of the whole must be on the terms of
this License, whose permissions for other licensees extend to the
entire whole, and thus to each and every part regardless of who wrote it.

Thus, it is not the intent of this section to claim rights or contest
your rights to work written entirely by you; rather, the intent is to
exercise the right to control the distribution of derivative or
collective works based on the Program.

In addition, mere aggregation of another work not based on the Program
with the Program (or with a work based on the Program) on a volume of
a storage or distribution medium does not bring the other work under
the scope of this License.

  3. You may copy and distribute the Program (or a work based on it,
under Section 2) in object code or executable form under the terms of
Sections 1 and 2 above provided that you also do one of the following:

    a) Accompany it with the complete corresponding machine-readable
    source code, which must be distributed under the terms of Sections
    1 and 2 above on a medium customarily used for software interchange; or,

    b) Accompany it with a written offer, valid for at least three
    years, to give any third party, for a charge no more than your
    cost of physically performing source distribution, a complete
    machine-readable copy of the corresponding source code, to be
    distributed under the terms of Sections 1 and 2 above on a medium
    customarily used for software interchange; or,

    c) Accompany it with the information you received as to the offer
    to distribute corresponding source code.  (This alternative is
    allowed only for noncommercial distribution and only if you
    received the program in object code or executable form with such
    an offer, in accord with Subsection b above.)

The source code for a work means the preferred form of the work for
making modifications to it.  For an executable work, complete source
code means all the source code for all modules it contains, plus any
associated interface definition files, plus the scripts used to
control compilation and installation of the executable.  However, as a
special exception, the source code distributed need not include
anything that is normally distributed (in either source or binary
form) with the major components (compiler, kernel, and so on) of the
operating system on which the executable runs, unless that component
itself accompanies the executable.

If distribution of executable or object code is made by offering
access to copy from a designated place, then offering equivalent
access to copy the source code from the same place counts as
distribution of the source code, even though third parties are not
compelled to copy the source along with the object code.

  4. You may not copy, modify, sublicense, or distribute the Program
except as expressly provided under this License.  Any attempt
otherwise to copy, modify, sublicense or distribute the Program is
void, and will automatically terminate your rights under this License.
However, parties who have received copies, or rights, from you under
this License will not have their licenses terminated so long as such
parties remain in full compliance.

  5. You are not required to accept this License, since you have not
signed it.  However, nothing else grants you permission to modify or
distribute the Program or its derivative works.  These actions are
prohibited by law if you do not accept this License.  Therefore, by
modifying or distributing the Program (or any work based on the
Program), you indicate your acceptance of this License to do so, and
all its terms and conditions for copying, distributing or modifying
the Program or works based on it.

  6. Each time you redistribute the Program (or any work based on the
Program), the recipient automatically receives a license from the
original licensor to copy, distribute or modify the Program subject to
these terms and conditions.  You may not impose any further
restrictions on the recipients\' exercise of the rights granted herein.
You are not responsible for enforcing compliance by third parties to
this License.

  7. If, as a consequence of a court judgment or allegation of patent
infringement or for any other reason (not limited to patent issues),
conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot
distribute so as to satisfy simultaneously your obligations under this
License and any other pertinent obligations, then as a consequence you
may not distribute the Program at all.  For example, if a patent
license would not permit royalty-free redistribution of the Program by
all those who receive copies directly or indirectly through you, then
the only way you could satisfy both it and this License would be to
refrain entirely from distribution of the Program.

If any portion of this section is held invalid or unenforceable under
any particular circumstance, the balance of the section is intended to
apply and the section as a whole is intended to apply in other
circumstances.

It is not the purpose of this section to induce you to infringe any
patents or other property right claims or to contest validity of any
such claims; this section has the sole purpose of protecting the
integrity of the free software distribution system, which is
implemented by public license practices.  Many people have made
generous contributions to the wide range of software distributed
through that system in reliance on consistent application of that
system; it is up to the author/donor to decide if he or she is willing
to distribute software through any other system and a licensee cannot
impose that choice.

This section is intended to make thoroughly clear what is believed to
be a consequence of the rest of this License.

  8. If the distribution and/or use of the Program is restricted in
certain countries either by patents or by copyrighted interfaces, the
original copyright holder who places the Program under this License
may add an explicit geographical distribution limitation excluding
those countries, so that distribution is permitted only in or among
countries not thus excluded.  In such case, this License incorporates
the limitation as if written in the body of this License.

  9. The Free Software Foundation may publish revised and/or new versions
of the General Public License from time to time.  Such new versions will
be similar in spirit to the present version, but may differ in detail to
address new problems or concerns.

Each version is given a distinguishing version number.  If the Program
specifies a version number of this License which applies to it and "any
later version", you have the option of following the terms and conditions
either of that version or of any later version published by the Free
Software Foundation.  If the Program does not specify a version number of
this License, you may choose any version ever published by the Free Software
Foundation.

  10. If you wish to incorporate parts of the Program into other free
programs whose distribution conditions are different, write to the author
to ask for permission.  For software which is copyrighted by the Free
Software Foundation, write to the Free Software Foundation; we sometimes
make exceptions for this.  Our decision will be guided by the two goals
of preserving the free status of all derivatives of our free software and
of promoting the sharing and reuse of software generally.

NO WARRANTY
-----------

  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
REPAIR OR CORRECTION.

  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGES.

---------------------------
END OF TERMS AND CONDITIONS',
    'readme' => '--------------------
SeoFilter
--------------------
Author: Evgeniy Sheronov <webrush@bk.ru>
--------------------

SeoFilter for Minishop2 & mSearch2 and not only for MODX Revolution.
https://modx.pro/components/12921-the-announcement-seofilter-ncseo-for-mfilter2-and-not-only/

Link for Full Documentation in next release.',
    'chunks' => 
    array (
    ),
    'setup-options' => 'seofilter-1.2.1-beta/setup-options.php',
  ),
  'manifest-vehicles' => 
  array (
    0 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modNamespace',
      'guid' => '845f2ba732fa21b3c2d6fcb630ff9c6a',
      'native_key' => 'seofilter',
      'filename' => 'modNamespace/6e0fe746ca36918665e2514e14ceaaba.vehicle',
      'namespace' => 'seofilter',
    ),
    1 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'a64ac84281961486d84fa0c42779dbed',
      'native_key' => 'seofilter_separator',
      'filename' => 'modSystemSetting/3bcb122567f889efa2b5070169aa924c.vehicle',
      'namespace' => 'seofilter',
    ),
    2 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '8b477ce36194d253d88c09b882148791',
      'native_key' => 'seofilter_base_get',
      'filename' => 'modSystemSetting/6922d933a4c06c0bb67dda4e2c878eef.vehicle',
      'namespace' => 'seofilter',
    ),
    3 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'c72009858c2a99448382d480ee56a3cf',
      'native_key' => 'seofilter_ajax',
      'filename' => 'modSystemSetting/98aeb8c1fc5840a31fdbda007dd3fc5c.vehicle',
      'namespace' => 'seofilter',
    ),
    4 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'e84e80b7b0a59ed511afe64ade1c0ca4',
      'native_key' => 'seofilter_decline',
      'filename' => 'modSystemSetting/209427be2345e58c1fbb88d25ba06e1e.vehicle',
      'namespace' => 'seofilter',
    ),
    5 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '935c450aa21f28e9fc616b584cfd1c3e',
      'native_key' => 'seofilter_morpher_username',
      'filename' => 'modSystemSetting/f008ba87f14aeb918cedf81a41c0c366.vehicle',
      'namespace' => 'seofilter',
    ),
    6 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '51025ac3c98a526103601e78086f49af',
      'native_key' => 'seofilter_morpher_password',
      'filename' => 'modSystemSetting/83fa668e1c448cf144f3091c0a020f42.vehicle',
      'namespace' => 'seofilter',
    ),
    7 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'b6756e97d5e1596738fdd3813a7ec7d0',
      'native_key' => 'seofilter_classes',
      'filename' => 'modSystemSetting/0aba02c4127488a9f2574ac38386150e.vehicle',
      'namespace' => 'seofilter',
    ),
    8 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '71be07405e67c7932ac01147b2bc2af6',
      'native_key' => 'seofilter_templates',
      'filename' => 'modSystemSetting/8695ab3cd1ca24a9d21bd836853a10cc.vehicle',
      'namespace' => 'seofilter',
    ),
    9 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'a0aa100ce5c618b656a95b55d3241689',
      'native_key' => 'seofilter_count',
      'filename' => 'modSystemSetting/aa9776fe7605a4b7dd6a59113b3a13b5.vehicle',
      'namespace' => 'seofilter',
    ),
    10 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '2c3e7984a3af09f887e0330a25c45c95',
      'native_key' => 'seofilter_choose',
      'filename' => 'modSystemSetting/b20dc082a0f3662247957e2552e88d36.vehicle',
      'namespace' => 'seofilter',
    ),
    11 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '1c2b4bea1a678a36bddc2d78cff19d87',
      'native_key' => 'seofilter_snippet',
      'filename' => 'modSystemSetting/3227b049ce182ac327c83aa05632608c.vehicle',
      'namespace' => 'seofilter',
    ),
    12 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'a82dd13bd35184325363a74ce16fb3fb',
      'native_key' => 'seofilter_select',
      'filename' => 'modSystemSetting/87aeb0be00fe8c4db97bbbc89b703a13.vehicle',
      'namespace' => 'seofilter',
    ),
    13 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '95682d8f8bccdd9aa3f5f330260e5754',
      'native_key' => 'seofilter_title',
      'filename' => 'modSystemSetting/c9d6e3015597f6ba6248b9219bbdf941.vehicle',
      'namespace' => 'seofilter',
    ),
    14 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '159b16d98a5f2f4c7fe88d01f5e39dbd',
      'native_key' => 'seofilter_description',
      'filename' => 'modSystemSetting/e91f485d4ef3f50b97fa1c21a427fd4d.vehicle',
      'namespace' => 'seofilter',
    ),
    15 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '6b6499c0a9d598299c5fd31d3383ab85',
      'native_key' => 'seofilter_introtext',
      'filename' => 'modSystemSetting/67dbd7e1baa89116f71cc28a0297571a.vehicle',
      'namespace' => 'seofilter',
    ),
    16 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'd755a414131c49d6d6d9e5c1391d12e9',
      'native_key' => 'seofilter_link',
      'filename' => 'modSystemSetting/3d200fca6f4a5f0f6ec63ea0c25e14d8.vehicle',
      'namespace' => 'seofilter',
    ),
    17 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '22cafc974b4cc973c2f82563a7413c5a',
      'native_key' => 'seofilter_h1',
      'filename' => 'modSystemSetting/86d56deb06d621371e6d0683eec78af4.vehicle',
      'namespace' => 'seofilter',
    ),
    18 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'c1e83aa650d1960bfcb452c142e8d5f6',
      'native_key' => 'seofilter_h2',
      'filename' => 'modSystemSetting/58b84fdbb82368ae4d494c6364dfd30d.vehicle',
      'namespace' => 'seofilter',
    ),
    19 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'da89f77998eb8497c1e66d27003e2414',
      'native_key' => 'seofilter_text',
      'filename' => 'modSystemSetting/97d4ab2891ae31a89c84f65bf3daebb2.vehicle',
      'namespace' => 'seofilter',
    ),
    20 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '47c5bd3e6ea465e6918ab4671bc94421',
      'native_key' => 'seofilter_content',
      'filename' => 'modSystemSetting/9648927f6d4a72c5dc2f99d11a31f0a5.vehicle',
      'namespace' => 'seofilter',
    ),
    21 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'b097368758d2a58c2680e4337797f208',
      'native_key' => 'seofilter_replacebefore',
      'filename' => 'modSystemSetting/f3b25ea37ac80519fc52cc4ae7eff014.vehicle',
      'namespace' => 'seofilter',
    ),
    22 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '5035e663879ee00535189c5f116c82bb',
      'native_key' => 'seofilter_replaceseparator',
      'filename' => 'modSystemSetting/de7708f6fc6167d8cacee6c69d33ed6b.vehicle',
      'namespace' => 'seofilter',
    ),
    23 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '7ed4f0107ce8874b2f2f433cc7070bd7',
      'native_key' => 'seofilter_jtitle',
      'filename' => 'modSystemSetting/7f6c506f35e3bd918cf6fd6b0ff60e15.vehicle',
      'namespace' => 'seofilter',
    ),
    24 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '65a62b79f41368bdf54cf0b838f82644',
      'native_key' => 'seofilter_jdescription',
      'filename' => 'modSystemSetting/4a726e069ba8d4357b107e7c6ec9515f.vehicle',
      'namespace' => 'seofilter',
    ),
    25 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'ef59e20773f2bcf55a4e736127a39b15',
      'native_key' => 'seofilter_jintrotext',
      'filename' => 'modSystemSetting/d7a2540379d003296f1f85eb4fcd2313.vehicle',
      'namespace' => 'seofilter',
    ),
    26 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'e28e05dc8d878aefba98073ab172fac7',
      'native_key' => 'seofilter_jlink',
      'filename' => 'modSystemSetting/a8c61195a98c62a1409cf9333f40fdb6.vehicle',
      'namespace' => 'seofilter',
    ),
    27 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'aef82e7a92d8cd0e46575bac3508f557',
      'native_key' => 'seofilter_jh1',
      'filename' => 'modSystemSetting/907ebb0d2ee7c1ad36470648aadd3e85.vehicle',
      'namespace' => 'seofilter',
    ),
    28 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'b78c2ef90a4101e3c6d53394ed3e4348',
      'native_key' => 'seofilter_jh2',
      'filename' => 'modSystemSetting/aa48591d5b71f3283dbc65191ead002c.vehicle',
      'namespace' => 'seofilter',
    ),
    29 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'b5e4fc17be11290bcd9888dec1259633',
      'native_key' => 'seofilter_jtext',
      'filename' => 'modSystemSetting/b7bc9bb7785aa8e7a185472faa2b1391.vehicle',
      'namespace' => 'seofilter',
    ),
    30 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '39908d04660501868e145a3bfd1bac1f',
      'native_key' => 'seofilter_jcontent',
      'filename' => 'modSystemSetting/b5f4edc4daf34183959701a61aaf17b6.vehicle',
      'namespace' => 'seofilter',
    ),
    31 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modMenu',
      'guid' => '308fedfcedf67e48f5ba0c6d95d2c002',
      'native_key' => 'seofilter',
      'filename' => 'modMenu/3f506997dc3e68fe24b1287d14b2d966.vehicle',
      'namespace' => 'seofilter',
    ),
    32 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modCategory',
      'guid' => '29404eed58318b81020871943ebd0f9d',
      'native_key' => NULL,
      'filename' => 'modCategory/a5645f64e675f15441adc94b94e5db5a.vehicle',
      'namespace' => 'seofilter',
    ),
  ),
);