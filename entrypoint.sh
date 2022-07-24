#!/bin/sh

set -eux

/replacetool \
  --bin:"$bin" \
  --spec:"$spec" \
  --config:"$config" \
  --service:"$service"

readonly rpmbuild_dir="$HOME/rpmbuild"
readonly build_dir="$rpmbuild_dir/BUILD"
readonly spec_dir="$rpmbuild_dir/SPECS"
readonly rpm_dir="$rpmbuild_dir/RPMS"
(
  cp "$bin" "$build_dir"
  cp "$config" "$build_dir"
  cp "$service" "$build_dir"

  cp -p "$spec" "$spec_dir"
  rpmbuild -bb "$spec_dir/$spec"
)

cp -p "$rpm_dir"/*.rpm .

ls -lah ./*.rpm
