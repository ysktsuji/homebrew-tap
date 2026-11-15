# frozen_string_literal: true

cask "super-engineering" do
  version "c095cef4"
  sha256 "e336ed4ab8928725b3907e3b7c2c5672221267a71a539e909c6d38980d34c522"

  url "https://releases.super.engineering/nightly/super.engineering-nightly-#{version}-arm64.dmg"
  name "super.engineering"
  desc "Native workspace for running parallel AI coding agents"
  homepage "https://super.engineering/"

  livecheck do
    url "https://super.engineering/api/download?arch=arm64"
    strategy :header_match do |headers|
      match = headers["location"].to_s.match(%r{/super\.engineering-nightly-([0-9a-f]+)-arm64\.dmg\z})
      match[1] if match
    end
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "super.engineering.app"
end
