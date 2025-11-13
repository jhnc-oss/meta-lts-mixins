meta-mixins-lts - scarthgap/go
==============================

"Mixin" layer for adding latest Go toolchain versions into the Yocto Project LTS.

At the time Scarthgap was released in April 2024, Go 1.22 was the latest version
and officially Scarthgap supports only that. This thin special-purpose mixin
layer is meant to address this issue by backporting Go recipes from the master
branch of openembedded-core.

Dependencies
------------

This layer depends on:

- URI: git://github.com/openembedded/openembedded-core.git  
  layers: meta  
  branch: scarthgap

Contributing
------------

The patches can be backported from openembedded-core with:

 git -C ../openembedded-core format-patch --stdout -1 origin/master meta/recipes-devtools/go | \
 git am --signoff -p4 --directory=recipes-devtools/go

The yocto-patches mailinglist (yocto-patches@lists.yoctoproject.org) is used
for questions, comments and patch review. It is subscriber only, so please
register before posting.

Send pull requests to yocto-patches@lists.yoctoproject.org with
'[meta-lts-mixins][scarthgap/go]' in the subject.

When sending single patches, please use something like:
git send-email -M -1 --to=yocto-patches@lists.yoctoproject.org --subject-prefix='meta-lts-mixins][scarthgap/go][PATCH'

Maintenance
-----------

Layer maintainers:
* Jose Quaresma <jose.quaresma@foundries.io>
* Peter Marko <peter.marko@siemens.com>

Quality Assurance
-----------------

QA tests are using original openembedded-core testsuites.
Current plan is to backport QA test changes to openembedded-core scarthgap branch.
When that is no longer possible, changes will picked here.

Automated tests to verify go toolchain functionality are being executed with following configurations and commands:

* OEQA runtime

    ```
    IMAGE_INSTALL:append = " packagegroup-core-ssh-dropbear go-helloworld packagegroup-go-sdk-target"
    IMAGE_CLASSES += "testimage"
    TEST_SUITES = "ping ssh go"
    QB_MEM = "-m 2048"
    ```

    ```
    bitbake core-image-minimal && bitbake core-image-minimal:do_testimage
    ```

* OEQA SDK

    ```
    IMAGE_CLASSES += "testimage"
    SDK_TOOLCHAIN_LANGS = "go"
    TESTSDK_SUITES = "go"
    ```

    ```
    bitbake core-image-minimal:do_populate_sdk && bitbake core-image-minimal:do_testsdk
    ```

* OEQA selftest

    ```
    SANITY_TESTED_DISTROS = ""
    ```

    ```
    oe-selftest -r gotoolchain -j $(grep -c ^processor /proc/cpuinfo)
    ```
