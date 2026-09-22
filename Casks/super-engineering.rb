# frozen_string_literal: true

cask "super-engineering" do
  version "23aed9a6"
  sha256 "315dc90fa5ab3ab8b966d51409ba04e2cd1b21442928f542ca9945c4bbb1ba11"

  url "https://releases.superconductor.so/nightly/Superconductor-nightly-#{version}-arm64.dmg"
  name "super.engineering"
  desc "Native workspace for running parallel AI coding agents"
  homepage "https://super.engineering/"

  livecheck do
    url "https://super.engineering/api/download"
    strategy :header_match do |headers|
      match = headers["location"].to_s.match(%r{/Superconductor-nightly-([0-9a-f]+)-arm64\.dmg\z})
      match[1] if match
    end
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "super.engineering.app"
end
