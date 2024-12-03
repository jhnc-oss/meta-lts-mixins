meta-mixins-lts - wrynose/rust
==============================

A "mixin" layer for adding current Rust toolchain into the Yocto Project LTS.
At the time Wrynose was released in May 2026 it included Rust 1.94.1, and
officially Wrynose supports only that. This thin special-purpose mixin
layer is meant to provide a current Rust toolchain for Wrynose by
backporting the appropriate recipes from the master branch of
openembedded-core.

Notes
-----

- **Not all changes carried here have been fully tested individually!**
  Care has been taken to keep backported changes in the same order as
  they have been applied to oe-core, so the various Rust versions are
  believed to be useable, but not all platforms are tested for each
  version. It is highly recommended that you perform your own tests for
  correctness when using this layer.
- The newer version of librsvg from master has been backported since
  there is not a straightforward way to update the existing one via
  bbappend.  Backporting a working recipe should be easier to maintain
  than developing an update of the older recipe in wrynose.
- python3-cryptography has been left alone since the recipe in wrynose
  still works with the newer toolchain, and updating it seems to have
  more potential impact due to upstream API changes and its known to be
  finicky build.  This may change if sufficient rationale for doing the
  backport becomes apparent.
- While changes to Rust recipe and class files related to oe-selftest
  support are included, and the backported Rust test is included as the
  "rust_mixin", it is not guaranteed that it will always be in a passing
  state for all platforms.  Best efforts are made to have the selftest
  pass with the qemux86-64 and qemuarm64 machines.
- The intent is to track any further upgrades that occur in the master
  branch of oe-core, with an expected end of support in April 2030, the
  same as Yocto Project's planned EOL for Wrynose (per
  https://wiki.yoctoproject.org/wiki/Releases).

Dependencies
------------

This layer depends on:

- URI: git://github.com/openembedded/openembedded-core.git  
  layers: meta  
  branch: wrynose

Contributing
------------

The yocto-patches mailinglist (yocto-patches@lists.yoctoproject.org) is used
for questions, comments and patch review. It is subscriber only, so please
register before posting.

Send pull requests to yocto-patches@lists.yoctoproject.org with
'[meta-lts-mixins][wrynose/rust]' in the subject.

When sending single patches, please use something like:
git send-email -M -1 --to=yocto-patches@lists.yoctoproject.org --subject-prefix='meta-lts-mixins][wrynose/rust][PATCH'

Note that changes that are not direct backports from oe-core master branch, or
are not fixes for a demonstrated build breakage against Wrynose are unlikely
to be accepted.  Functional changes should be submitted and merged to oe-core
master branch first.

Maintenance
-----------

Layer maintainers:
Scott Murray <scott.murray@konsulko.com>
