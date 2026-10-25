# frozen_string_literal: true

cask "super-engineering" do
  version "0d31ddc4"
  sha256 "aa812d48b74e127b8db4e1843313dce3c3963009bf5a51691c6fbea1af6004da"

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
